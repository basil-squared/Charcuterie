SMODS.Joker {
	key = 'incomprehensible',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 72,y=0},
	rarity = 3,
	cost =  7,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				message = "...",
				colour = G.C.BLACk
			}
		end
	end
}