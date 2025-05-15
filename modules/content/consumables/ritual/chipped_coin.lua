SMODS.Consumable({
	key = "ritual_chippedcoin",
	set = "ritual",
	loc_txt = {
		name = "Chipped Coin",
		text = { "{C:green}#1#%{} chance to {C:attention}double{} money.", "{C:red}#2#%{} Chance to backfire and set money to {C:money}$0{} instead." }

	},
	atlas = ASPL.G.ritualatlas.key,
	pos = { x = 6, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,

	use = function(self,card,area,copier)
		if ASPL.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
			ease_dollars(-to_big(G.GAME.dollars))
			-- #TODO: put the logic here
		else
			ease_dollars(to_big((G.GAME.dollars or 0)))
		end
	end,
	can_use = function(self,card)
		return true
	end

})