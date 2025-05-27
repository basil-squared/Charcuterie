SMODS.Joker {
	key = "boredjoker",
	pos = { x = 35, y = 0 },
	atlas = CHAR.G.jokeratlas.key,
	rarity = 1,
	blueprint_compat = true,
	cost = 3,
	config = { extra = { t_mult = 7, type = 'charcuterie_grayflush' }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
			return {
				mult = card.ability.extra.t_mult
			}
		end
	end
}