SMODS.Joker {
	key = "ambrosia",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=32,y=0},
	config = {extra = {hands_max = 10, hands_remaining = 10}},
	loc_vars = function(self,info_queue,card)
		return {vars={card.ability.extra.hands_max, card.ability.extra.hands_remaining}}
	end
}
-- TODO: Give effect before next commit