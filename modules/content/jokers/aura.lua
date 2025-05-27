SMODS.Joker {
	key = "aura",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 37,y=0},
	config = {extra = {endofround = 10}},
	loc_vars = function(self,info_queue,card) return {vars = {card.ability.extra.endofround}}  end,
	rarity = 2,
	cost = 5,
}
-- TODO: Give effect before next commit