SMODS.Joker {
	key = 'sketch',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=69,y=0},
	config = {extra = {odds = 4,mult = 4}},
	loc_vars = function(self,info_queue,card)
		return {vars = {(G.GAME.probabilities.normal or 1),card.ability.extra.odds, card.ability.extra.mult}}
	end,
	rarity = 2,
	cost =5,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play and context.other_card:is_face() then
			if pseudorandom('thatoneofficer') < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					xmult = card.ability.extra.mult
				}
			end
		end
	end
}