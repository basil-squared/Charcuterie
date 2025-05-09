SMODS.Joker({
	key = "virtuous",
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 11, y = 0 },
	loc_txt = {
		name = "Virtuous Joker",
		text = {
			"Awards {C:attention}$1{} per {C:astropulvis_purified}Purified{} card",
			"in your full deck at end of round.",
			"{S:0.7,C:inactive}(currently{}{S:0.7,C:attention} $#1#{}{S:0.7,C;inactive}.)",
		},
	},
	config = { extra = {given_dollars = 0}},
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