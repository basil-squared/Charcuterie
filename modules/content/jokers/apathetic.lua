SMODS.Joker {
	key = "apatheticjoker",
	atlas = CHAR.G.jokeratlas.key,
	blueprint_compat = true,
	rarity = 1,
	cost = 3,
	pos = { x = 34, y = 0 },
	config = { extra = { t_chips = 70, type = 'charcuterie_grayflush' } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
			return {
				chips = card.ability.extra.t_chips
			}
		end
	end
}