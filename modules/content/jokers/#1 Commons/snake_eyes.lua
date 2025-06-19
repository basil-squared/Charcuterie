SMODS.Joker {
	key = "snake_eyes",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 62, y= 0},
	rarity = 1,
	cost = 5,
	add_to_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v * 0.5
		end
		G.GAME.RISK_RATE = 0.5
	end,
	remove_from_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v / 0.5
		end
		G.GAME.RISK_RATE = 1

	end,


}