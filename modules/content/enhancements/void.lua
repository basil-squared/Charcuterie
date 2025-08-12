SMODS.Enhancement {
	key = 'void',
	config = {extra={percentage_dropped = 5}},
	atlas = CHAR.G.enhancementatlas.key,
	pos = {x = 9 ,y=0},
	loc_vars = function(self,info_queue,card)
		return {
			vars = {
				card.ability.extra.percentage_dropped
			}
		}
	end,
	calculate = function(self,card,context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				message = localize('k_reduced'),
				func = function()
					G.GAME.blind.chips =  G.GAME.blind.chips - (G.GAME.blind.chips * (card.ability.extra.percentage_dropped / 100))
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				end
			}

		end
	end
}