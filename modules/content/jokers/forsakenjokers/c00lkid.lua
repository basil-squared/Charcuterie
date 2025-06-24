SMODS.Joker {
	key = "c00lkid",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 43, y=0},
	config = {extra={x_chip_gain = 0.3,curr_xchip = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.x_chip_gain,card.ability.extra.curr_xchip}}
	end,
	rarity = 3,
	calculate = function (self,card,context)
		if context.setting_blind then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.perishable == true and G.jokers.cards[i]:can_calculate(true) then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end

			if #jokers == 0 then

				return {
					message = "Miss!",
					colour = G.C.RED,
					sound = 'charcuterie_coolkid_miss'
				}
			end
			for i=1, #jokers do
				victim = jokers[i]
				if not victim then
					print("none to slice")
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
				card.ability.extra.curr_xchip = card.ability.extra.curr_xchip + card.ability.extra.x_chip_gain

			end
			play_sound('charcuterie_coolkid_wo_hit')
			return {
				message = "TAG!",
				colour = G.C.RED,
				sound = 'charcuterie_coolkid_hit'
			}
		end
		if context.joker_main then
			return {
				xchips = card.ability.extra.curr_xchip
			}
		end
	end
}