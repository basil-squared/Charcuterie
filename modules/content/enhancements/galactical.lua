SMODS.Enhancement {
	key = "galactical",
-- TODO: go to new prob system
	config = { extra = { num =1, odds = 5 } },
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
		local num,denom = SMODS.get_probability_vars(card,card.ability.extra.num,card.ability.extra.odds,"galactical")
		return { vars = { num,denom } }
	end,


	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card,'graceandrockysavestars',card.ability.extra.num,card.ability.extra.odds,"galactical") then
				return { level_up = 1, message = "Upgrade!" }
			end
		end
	end


}