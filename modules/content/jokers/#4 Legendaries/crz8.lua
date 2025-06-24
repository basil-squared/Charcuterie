SMODS.Joker({
	key = "crazyeight",
	loc_txt = {

	},
	config = { extra = { xmult = 4, chips = 88 } },
	rarity = 4,
	atlas = CHAR.G.jokeratlas.key,
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	cost = 8,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 8 then
				return {
					message = localize({ type = "variable", key = "x_mult", vars = { card.ability.extra.mult } }),
					xmult = card.ability.extra.xmult,
					chips = card.ability.extra.chips,
					card = context.other_card,
				}
			end
		end
	end,
})