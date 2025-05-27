SMODS.Joker {
	key = "caption",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=38,y=0},
	config = {extra = {xmult_increm = 0.1,totalxmult = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult_increm,card.ability.extra.totalxmult}}
	end,
	rarity = 3,
}
-- TODO: Give effect before next commit