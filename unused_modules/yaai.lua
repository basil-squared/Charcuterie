SMODS.Joker {
	key = 'yaai',
	rarity = 3,
	atlas = CHAR.G.jokeratlas.key, -- LAST JOKER TO USE THIS BULLSHIT FUCKED UP ATLAS LETS FUCKING GOOOOOOOOO
	pos = {x=85,y=0},
	config = {vars = {curr_xmult = 3, copies = 2}},
	unlocked = false,
	check_for_unlock = function(self,args)
		-- MAKE THE STUPID UNLOCK CONDITION FOR THIS BULLSHIT LATER
		-- Guess i AM an idiot
	end,
	calculate = function(self,card,context)

		if context.end_of_round and context.game_over and context.main_eval then

		end
	end
}