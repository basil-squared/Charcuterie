local chrono_lc = SMODS.Atlas {
    key = "chrono_lc",
    path = "chrono_lc.png",
    px = 71,
    py = 95,
}

local chrono_hc = SMODS.Atlas {
    key = "chrono_hc",
    path = "chrono_hc.png",
    px = 71,
    py = 95,
}

local plg_lc = SMODS.Atlas {
    key = "plg_lc",
    path = "plg_lc.png",
    px = 71,
    py = 95,
}

local plg_hc = SMODS.Atlas {
    key = "plg_hc",
    path = "plg_hc.png",
    px = 71,
    py = 95,
}
local jokeratlas = SMODS.Atlas {
    key = "joker_atlas",
    path = "joker_atlas.png",
    px = 71,
    py = 95,
}
local enhancementatlas = SMODS.Atlas {
    key = "enhancement_atlas",
    path = "enhancementatlas.png",
    px = 71,
    py = 95,
}

local ritualatlas = SMODS.Atlas {
    key = "ritual_atlas",
    path = "ritualatlas.png",
    px = 71,
    py = 95,
}
SMODS.DeckSkin {
    key = "chronophobia",
    suit = "Hearts",
    loc_txt = "Chronophobia",
    palettes = {
        {
            key = 'lc',
            ranks = {'Jack', 'Queen', 'King',},
            display_ranks = {"King",  "Queen", "Jack"},
            atlas = chrono_lc.key,
            pos_style = 'collab',
            
        },
        {
            key = 'hc',
            ranks = {'Jack', 'Queen', 'King',},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = chrono_hc.key,
            pos_style = 'collab',
            colour = HEX("ff0000"),
            
        },
    },
}


SMODS.DeckSkin {
    key = "perfectlightgaia",
    suit =  "Spades",
    loc_txt = "Perfect Light Gaia",
    palettes = {
        {
            key = "lc",
            ranks = {'Jack', "Queen", "King",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = plg_lc.key,
            pos_style = 'collab'
        },
        {
            key = "hc",
            ranks = {'Jack',"Queen","King",},
            display_ranks = {"King","Queen","Jack"},
            atlas = plg_hc.key,
            pos_style = "collab",
            color = HEX("9D00FF")

        }
    }
    
}


SMODS.Joker {
    key = "crazy8",
    loc_txt = {
        name = "Crazy 8",
        text = {"For every {C:attention}8{} Played,", "grants {C:attention}#1#{} Mult."}
        
        
    },
    config = { extra = {xmult = 4, chips = 88}},
    rarity = 2,
    atlas = jokeratlas.key,
    pos = {x= 0, y= 0},
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end, 
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 8 then
                return {
                    message = localize { type = 'variable', key = 'x_mult', vars = {card.ability.extra.mult}},
                    xmult = card.ability.extra.xmult,
                    chips = card.ability.extra.chips,
                    card = context.other_card
                }
            end
        end
    end,


}

SMODS.Joker {
    key = "jonker",
    loc_txt = {
        name = "The Jonker",
        text = {"Why so Serious?"}
    },
    config = { extra = {xmult = 0, chips = -100}},
    rarity = 1,
    atlas = jokeratlas.key,
    pos = {x = 1, y=0},
    cost = 0,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                chips = card.ability.extra.chips
            }
        end

    end


}

SMODS.Joker {
    key = "the_j",
    loc_txt = {
        name = "The J",
        text = {"For every joker, gain {C:mult}x#1#{} Mult."},
    },
    config = {extra = {xmult = 1.5}},
    rarity = 3,
    atlas = jokeratlas.key,
    pos = {x = 2, y = 0},
    cost = 5,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.post_trigger then
            return {
                message = "THE J. ",
                xmult = (card.ability.extra.xmult * #G.jokers.cards)
            }
        end
    end



    
}
SMODS.Joker {
    key = "alien_joker",
    loc_txt = {
        name = "Alien Joker",
        text = {"Turns any face card played into a {C:purple}Galactical{} Card. "}
    },
    rarity = 3,
    atlas = jokeratlas.key,
    pos = {x=6,y=0},
    cost=5,
    discovered = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then 
            if context.other_card:is_face() then
                context.other_card:juice_up(0.3,3)
                context.other_card:set_ability("m_astropulvis_galactical")
                return {
                    message = "Abducted!"
                }
            end
        end
    end 
}
   

SMODS.Enhancement {
    key = "galactical",
    loc_txt = {
        name = "Galactical Card",
        text = {"{C:green}#1# in #2# chance{} to upgrade", "the hand this card is played in."},
    },
    config = {extra = {odds = 20}},
    atlas = enhancementatlas.key,
    pos = {x=0,y=0},
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
    end,


    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom('galactical') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {level_up = 1, message = "Upgrade!"}
            end 
        end
    end


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
    use = function(self, card, area, copier)
        local potential_victims = {}
        for i =1, #G.jokers.cards do
            if G.jokers.cards[i]:can_calculate(true) then
                table.insert(potential_victims, G.jokers.cards[i])
        end


        end
        print(#potential_victims)
        victim = pseudorandom_element(potential_victims, pseudoseed("I LOVE AMONG US"))
        print(type(victim))
        victim.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',



            blockable = false,


            func = function()
                victim.start_dissolve()
                G.GAME.joker_buffer = 0


                return true;
            end

        }))
        if G.consumeables.config.card_limit - #G.consumeables.cards == 1 then
            SMODS.add_card({
                set="ritual"
            })

            else SMODS.add_card({set="ritual"}) SMODS.add_card({ set="ritual" })

        end


    end,
    can_use = function(self, card)
        local potential_victims = {}
        for i =1, #G.jokers.cards do
            if G.jokers.cards[i]:can_calculate(true) then
                table.insert(potential_victims, G.jokers.cards[i])
            end

        end
        if #potential_victims == 0 or #G.consumeables.cards >= G.consumeables.config.card_limit + 1 then
            return false

            else
                return true


        end
    end
}