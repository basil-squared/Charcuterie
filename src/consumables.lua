local ritualatlas = SMODS.Atlas {
    key = "ritual_atlas",
    path = "ritualatlas.png",
    px = 71,
    py = 95,
}


SMODS.ConsumableType {
    key = "ritual",
    primary_colour = HEX("140100"),
    secondary_colour = HEX("570803"),
    loc_txt =  	{
        name = 'Ritual Card', -- used on card type badges
        collection = 'Ritual Cards', -- label for the button to access the collection
        undiscovered = { -- description for undiscovered cards in the collection
            name = '???',
            text = { 'An undiscovered Ritual Card.', 'Keep your eyes peeled for these powerful, yet costly cards...' },
        },
    }
}

SMODS.Consumable {
    key = "ritual_bloodpact",
    set = "ritual",
    atlas = ritualatlas.key,
    pos = {x=0,y=0},
    loc_txt = {
        name = "Blood Pact",
        text = {"Spawn a random {C:red} Eternal Rare{} Joker."}
    },
    use = function(self,card,area,copier)
        local tempjok = SMODS.add_card({set= "Joker", rarity=1, stickers={"eternal"}})

        tempjok:set_eternal(true)
    end,
    can_use = function(self, card)
        if #G.jokers.cards >= G.jokers.config.card_limit then
            return false
        else return true

        end

    end
}

SMODS.Consumable {
    key = "ritual_sever",
    set = "ritual",
    atlas = ritualatlas.key,
    pos = {x=1,y=0},
    loc_txt = {
        name = "Sever",
        text = {"{C:red}Destroy{} a random Joker.", "Summon 2 {C:red}Ritual Cards{}."},
    },
    use = function(self,card,area,copier)
        local potential_victims = {}
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
                table.insert(potential_victims, G.jokers.cards[i])
            end
        end

        local victim = pseudorandom_element(potential_victims, pseudoseed("I LOVE AMONG US"))
        if not victim then return end  -- Safety check

        victim.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1

        -- Store reference in local variable for closure
        local dissolve_target = victim
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            blockable = false,
            func = function()
                if dissolve_target and dissolve_target.start_dissolve then
                    dissolve_target:start_dissolve()
                end
                G.GAME.joker_buffer = 0
                return true
            end
        }))

        --[[So, funny shit here, consumables is misspelt in the code of the game, so just remember..]]
        local slots_available = G.consumeables.config.card_limit - #G.consumeables.cards
        if slots_available >= 2 then
            SMODS.add_card({set = "ritual"})
            SMODS.add_card({set = "ritual"})
        elseif slots_available == 1 then
            SMODS.add_card({set = "ritual"})
        end
    end,

    can_use = function(self,card)
        local potential_victims = {}
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal  then
                table.insert(potential_victims, G.jokers.cards[i])
            end
        end
        return #potential_victims > 0 and #G.consumeables.cards < G.consumeables.config.card_limit
    end
}

SMODS.Consumable {
    key = "ritual_juxt",
    set = "ritual",
    atlas = ritualatlas.key,
    pos = {x=2,y=0},
    loc_txt = {
        name = "Juxtaposition",
        text = {"{C:green}50%{} chance to {C:chips}Duplicate{} a selected Joker","{C:green}50%{} chance to {C:red}Destroy{} a Joker."}
    },
    use = function(self,card,area,copier)
        local coin_flip = pseudorandom('two-face')

        if coin_flip > 0.49 then
            local card_ = copy_card(g.jokers.highlighted[1]), nil
        else
            local victim = g.jokers.highlighted[1]
            victim.getting_sliced = true
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1

            -- Store reference in local variable for closure
            local dissolve_target = victim
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                blockable = false,
                func = function()
                    if dissolve_target and dissolve_target.start_dissolve then
                        dissolve_target:start_dissolve()
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
        end
    end

}