SMODS.Joker  {
	key = 'infinite_ball',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=4,y=0},
	cost = 30,
	config = {extra = {odds = 4}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key="char_txt_oc"}
		return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,
	unlocked = false,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_infinite_ball'] then
			return true

		end
		return false

	end,
	rarity = "charcuterie_overclocked",
	calculate = function(self,card,context)
		if context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
				context.cardarea == G.play and
				context.other_card:get_id() == 8 and
				pseudorandom('fe8iwfwefweopjf') < ((G.GAME.probabilities.normal or 1) / card.ability.extra.odds) then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

			return {
				extra = {
					message = localize('k_plus_spectral'),
					message_card = card,
					func = function()
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Spectral',
									key_append = 'inf_ball'
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
					end
				},
			}
		end

	end
}