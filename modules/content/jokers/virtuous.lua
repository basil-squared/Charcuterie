SMODS.Joker({
	key = "virtuous",
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 11, y = 0 },
	loc_txt = {
		name = "Virutous Joker",
		text = {
			"Awards {C:attention}$1{} per {C:astropulvis_purified}Purified{} card",
			"in your full deck.",
			"{S:0.7,C:inactive}(currently{}{S:0.7,C:attention}$#1#{}{S:0.7,C;inactive}.)",
		},
	},

	rarity = 3,
	cost = 5,
	calculate = function(self, card, context) end,
})