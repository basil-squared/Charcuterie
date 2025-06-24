SMODS.Joker({
	key = "ufo",

	rarity = 3,
	atlas = CHAR.G.jokeratlas.key,
	blueprint_compat = false,
	pos = { x = 6, y = 0 },
	cost = 5,
	discovered = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
				context.other_card:juice_up(0.3, 3)
				context.other_card:set_ability("m_charcuterie_galactical")
				return {
					message = "Abducted!",
				}
			end
		end
	end,
})