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

        local uneditioned_jokers = {}
        local editioned_jokers = {}

        for i=1, #G.jokers.cards do
            if G.jokers.cards[i].edition == false then
                uneditioned_jokers[i] = G.jokers.cards[i]
            else
                editioned_jokers[i] = G.jokers.cards[i]
            end
        end

        local r_e_joker = pseudorandom_element(editioned_jokers, pseudoseed("edition joker"))
        local r_u_joker = pseudorandom_element(uneditioned_jokers,pseudoseed("unedition joker"))
        print(uneditioned_jokers)
        if ASPL.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
            r_e_joker:set_edition("")
        else
            local poss_editions = {"e_negative", "e_polychrome", "e_foil", "e_holographic"}
            r_u_joker:set_edition(pseudorandom_element(poss_editions,pseudoseed("I pissed myself")))
            r_u_joker:juice_up()
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