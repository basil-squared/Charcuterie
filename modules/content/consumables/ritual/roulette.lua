SMODS.Consumable {
    set = "ritual",
    key = "ritual_roulette",
    atlas = ASPL.G.ritualatlas.key,
    pos = {x = 6, y=0 },
    loc_txt = {
        name = "Roulette",
        text = {"{C:green}#1#%{} chance to apply"," An {C:enhanced}Edition{} to a random joker,","{C:red}#2#%{} chance to backfire,","{C:red}removing{} an edition from a random joker."},
    },
    loc_vars = function(self, info_queue, card)
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,
    use = function(self,card,area,copier)
        local random_joker = pseudorandom_element(G.jokers.cards, pseudoseed("I shit my pants"))
        if ASPL.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
            random_joker:set_edition("")
        else
            local poss_editions = {"e_negative", "e_polychrome", "e_foil", "e_holographic"}
            random_joker:set_edition(pseudorandom_element(poss_editions,pseudoseed("I pissed myself")))
            random_joker:juice_up()
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