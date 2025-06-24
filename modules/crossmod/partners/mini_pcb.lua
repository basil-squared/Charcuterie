Partner_API.Partner{
	key = "mini_pcb",
	name = "Mini PCB",
	unlocked = false,
	discovered = true,
	pos = {x = 0,y=0},
	atlas = CHAR.G.crossmod_partneratlas.key,
	config = {extra = {odds = 5}},
	loc_vars = function(self,info_queue,card)


		return {vars = {(G.GAME.probabilities.normal) or 1, card.ability.extra.odds}}
	end
}