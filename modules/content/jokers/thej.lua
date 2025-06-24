SMODS.Joker({
	key = "the_j",
	loc_txt = {
		name = "The J",
		text = { "For every joker, gain {X:mult,C:white}X#1#{} Mult." },
	},
	config = { extra = { xmult = 1.5 } },
	rarity = 3,
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 2, y = 0 },
	cost = 5,
	discovered = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = "THE J. ",
				xmult = (card.ability.extra.xmult * #G.jokers.cards),
			}
		end
	end,
})