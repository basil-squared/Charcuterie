Partner_API.Partner{
	key = "mini_stellar",
	name = "Mini Interstellar",
	unlocked = false,
	discovered = true,
	pos = {x = 1,y=0},
	atlas = CHAR.G.crossmod_partneratlas.key,
	config = {extra = {mult = 1.2}},
	loc_vars = function(self,info_queue,card)


		return {vars = {card.ability.extra.mult}}
	end
}