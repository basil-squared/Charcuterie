SMODS.Consumable {
    set = "ritual",
    key = "roulette",
    atlas = ASPL.G.ritualatlas.key,
    pos = {x = 6, y=0 },

    loc_vars = function(self, info_queue, card)
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,
    use = function(self, card, area, copier)
        local uneditioned_jokers = {}
        local editioned_jokers   = {}
    
        for _, joker in ipairs(G.jokers.cards) do
            if joker.edition then
                table.insert(editioned_jokers, joker)
            else
                table.insert(uneditioned_jokers, joker)
            end
        end
    
        local r_e_joker = (#editioned_jokers > 0) and pseudorandom_element(editioned_jokers, pseudoseed("edition joker")) or nil
        local r_u_joker = (#uneditioned_jokers > 0) and pseudorandom_element(uneditioned_jokers, pseudoseed("unedition joker")) or nil
    
        if ASPL.FUNC.negative_event_proc(G.GAME.Risk or 0) == false then
            if r_e_joker then
                r_e_joker:set_edition(nil)
            end
        else
            if r_u_joker then
                local poss_editions = {"e_negative", "e_polychrome", "e_foil", "e_holographic"}
                r_u_joker:set_edition(pseudorandom_element(poss_editions, pseudoseed("I pissed myself")))
                r_u_joker:juice_up()
            end
        end
    end,
    
    can_use = function(self,area)
        if #G.jokers.cards > 0 then
            return true
        else
            return false
        end
    end
}