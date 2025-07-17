SMODS.Enhancement {
	key = 'handy',
	config = { extra = { hands_granted = 1, odds = 4}},
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 6,y=0},
	loc_vars = function(self,info_queue,card)
		local _hand_text = 'hand'
		if card.ability.extra.hands_granted > 1 then
			_hand_text = 'hands'
		end
		return {vars = {
			(G.GAME.probabilities.normal or 1),
			card.ability.extra.odds,
			card.ability.extra.hands_granted,
			_hand_text
		}}
	end,
	calculate = function(self,card,context)
		if context.main_scoring and context.cardarea == G.play then
			if pseudorandom('orjgroigjreongroi') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						ease_hands(card.ability.extra.hands_granted)
					end

				}))
			end
		end
	end
}