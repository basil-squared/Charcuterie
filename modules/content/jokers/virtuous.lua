SMODS.Joker({
	key = "virtuous",
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 11, y = 0 },

	config = { extra = {given_dollars = 0}},
	blueprint_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.given_dollars }}
	end,

	rarity = 3,
	cost = 5,
	calc_dollar_bonus = function(self, card)
		card.ability.extra.given_dollars = (ASPL.FUNC.check_enhancement_deck("m_astropulvis_purified") or 0 )
		return card.ability.extra.given_dollars
	end,
})