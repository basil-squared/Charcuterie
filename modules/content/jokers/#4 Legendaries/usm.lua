SMODS.Joker {
	key = "usm",
	config = {extra = {curr_xmult = 1, xmult_gain = 1.5, base_xmult = 1}},
	atlas = CHAR.G.jokeratlas.key,
	pos = {x =65,y=0},
	soul_pos = {x=66,y=0},
	rarity = 4,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult_gain,card.ability.extra.curr_xmult}}
	end
}