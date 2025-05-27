SMODS.Joker {
	key = "wargames",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=16,y=0},

	config = { extra = {xmult = 0.5, curr_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.curr_xmult}}
	end,
	blueprint_compat = true,

	calculate = function(self,card,context)

		if context.joker_main then
			print("reached")
			local fh = context.full_hand
			for i=1, #fh do
				if SMODS.has_enhancement(fh[i],"m_charcuterie_unstable")then
					card.ability.extra.curr_xmult = 1.0
					return {
						message = "Reset"

					}
				end
			end
			card.ability.extra.curr_xmult = card.ability.extra.curr_xmult + card.ability.extra.xmult
			return {
				xmult = card.ability.extra.curr_xmult
			}
		end
	end
}