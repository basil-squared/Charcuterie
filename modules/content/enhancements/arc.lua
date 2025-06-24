SMODS.Enhancement {
	key = "arc",
	config = {extra = {odds = 3}},
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 4, y = 0 },
	loc_vars = function(self,info_queue,card)
		return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,
	calculate = function(self,card,context)


	end
}