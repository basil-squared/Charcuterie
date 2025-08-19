local get_joker_to_left = function(jokers,card)
	local index
	for i=1, #jokers do
		if jokers[i] == card then
			index = i - 1

		end

	end
	return index or 0
end


SMODS.Joker {
	key = "twotime",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=41,y=0},
	config = {extra = {oblation_gain = 2,req_oblation = 10, total_oblation = 0,  death_prevented = false,oblation_gain_permitted = true,convmult = 0}},
	rarity = 3,
	loc_vars = function(self,info_queue,card) return {vars = {card.ability.extra.oblation_gain,card.ability.extra.req_oblation,card.ability.extra.total_oblation,card.ability.extra.convmult}}  end,
	calculate = function(self,card,context)
		if context.joker_main then
			if card.ability.extra.convmult > 0 then
				return {
					xmult = card.ability.extra.convmult,
					colour = G.C.BLACk
				}
			end
		end
		if context.setting_blind then
			if card.ability.extra.total_oblation >= card.ability.extra.req_oblation then
				card.ability.extra.death_prevented = true
			end
			left_jok = G.jokers.cards[get_joker_to_left(G.jokers.cards,card)]
			if left_jok and left_jok:can_calculate(true) and not left_jok.ability.eternal and card.ability.extra.oblation_gain_permitted then -- can_calculate checks to see if the joker is getting destroyed already.
				left_jok.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				local dissolve_target = left_jok
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
				if card.ability.extra.oblation_gain_permitted then
					card.ability.extra.total_oblation = card.ability.extra.total_oblation + card.ability.extra.oblation_gain
				end

				return {
					message = localize('k_sacrifice_ex'),
					colour = G.C.BLACK
				}


			end
		end
		if context.end_of_round and context.game_over and context.main_eval then
			if card.ability.extra.total_oblation >= card.ability.extra.req_oblation then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.hand_text_area.blind_chips:juice_up()
						G.hand_text_area.game_chips:juice_up()
						play_sound('tarot1')
						card.ability.extra.oblation_gain_permitted = false
						card.ability.extra.convmult = card.ability.extra.total_oblation
						card.ability.extra.total_oblation = 0
						return true
					end
				}))
				return {
					message = localize('k_saved_ex'),
					saved = 'ph_two_time',
					colour = G.C.BLACK
				}
			end
		end

	end
}

-- TODO: Give effect before next commit