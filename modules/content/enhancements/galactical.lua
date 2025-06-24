SMODS.Enhancement {
	key = "galactical",

	config = { extra = { odds = 5 } },
	atlas = ASPL.G.enhancementatlas.key,
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,


	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			if pseudorandom('galactical') < G.GAME.probabilities.normal / card.ability.extra.odds then
				return { level_up = 1, message = "Upgrade!" }
			end
		end
	end


}