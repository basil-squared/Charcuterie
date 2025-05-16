SMODS.Joker({
	key = "juxtaposition",

	atlas = ASPL.G.jokeratlas.key,
	blueprint_compat = false,
	config = {
		extra = { jokplus = 0 },
	},
	pos = { x = 9, y = 0 },
	soul_pos = { x = 10, y = 0 },
	rarity = 4,
	loc_vars = function(self, info_queue, card)
		return {
			vars = { card.ability.extra.jokplus },
		}
	end,

	calculate = function(self, card, context)
		if
		context.card_added
						and context.card.ability.set == "Joker"
						and context.card.edition
						and context.card.edition.negative
		then
			context.card:set_edition(nil)
			card.ability.extra.jokplus = card.ability.extra.jokplus + 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokplus
	end,
	add_to_deck = function(self, card, from_debuff)
		jokers = G.jokers.cards
		for i = 1, #jokers do
			if jokers[i].edition and jokers[i].edition == jokers[i].edition.negative then
				jokers[i]:set_edition(nil)
				card.ability.extra.jokplus = card.ability.extra.jokplus + 1
			end
		end
	end,
})