SMODS.Joker({
	key = "crazyeight",
	loc_txt = {

	},
	config = { extra = {num_req = 8, xmult = 0.8, total_xmult = 1} },
	rarity = 4,
	atlas = CHAR.G.jokeratlas.key,
	blueprint_compat = true,
	pos = { x = 78, y = 0 },
	soul_pos = {x =79,y=0},
	cost = 8,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.num_req, card.ability.extra.xmult, card.ability.extra.total_xmult } }
	end,
	calculate = function(self, card, context)
		if context.before then
			local eights_in_deck = CHAR.FUNC.check_rank_deck(8)
			if eights_in_deck >= 8 then
				card.ability.extra.total_xmult = card.ability.extra.total_xmult + (card.ability.extra.xmult * eights_in_deck)
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.total_xmult
			}
		end
	end,
})