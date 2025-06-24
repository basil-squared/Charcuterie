SMODS.Edition {
	key = "melty",
	shader = "melty",

	config = {extra = {granted_mult = 3}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set = "Other", key = "aspl_txt_risk"}
		return {vars = {tostring((1 - (G.GAME.Risk or 0) ) * 100),self.config.extra.granted_mult, tostring((G.GAME.Risk or 0) * 100)}}

	end,
	calculate = function (self,card,context)
		if (
				context.post_joker
				and context.cardarea == G.jokers

		) or (
				context.main_scoring
				and context.cardarea == G.play
		) then


				if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false then
					local victim = card
					if not victim then
						return
					end -- Safety check

					victim.getting_sliced = true
					G.GAME.joker_buffer = G.GAME.joker_buffer - 1

					-- Store reference in local variable for closure
					local dissolve_target = victim
					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						blockable = false,
						func = function()
							if dissolve_target and dissolve_target.start_dissolve then
								dissolve_target:start_dissolve()
							end
							G.GAME.joker_buffer = 0
							return true
						end,
					}))
					return {
						message  = "Nope!"
					}
				else
					return {
						xmult = card.edition.extra.granted_mult
					}
				end
		end
	end

}