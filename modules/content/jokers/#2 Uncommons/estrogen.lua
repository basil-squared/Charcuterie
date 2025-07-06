SMODS.Joker({
	key = "estrogen",
	atlas = CHAR.G.jokeratlas.key,
	pos = { x = 14, y = 0 },
	

	config = {extra={ out_of = 5}},
	loc_vars = function(self,info_queue,card)
		return {vars={(G.GAME.probabilities.normal or 1), card.ability.extra.out_of}}
	end,
	blueprint_compat = true,

	rarity = 2,
	cost = 5,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if pseudorandom('girlpill') < G.GAME.probabilities.normal / card.ability.extra.out_of and context.other_card:is_face() then
				assert(SMODS.change_base(context.other_card,nil,'Queen'))
				return {
					message = ":3",
					colour = G.C.GREEN,
				}
			end
		end
	end
})