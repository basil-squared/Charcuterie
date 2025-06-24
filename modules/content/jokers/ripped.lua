SMODS.Joker {
	key = 'ripped',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=36,y=0},
	config = {extra = {xmult_gained = 0.1,total_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)

		return {vars = {card.ability.extra.xmult_gained, card.ability.extra.total_xmult}}
	end,
	rarity = 2,

}