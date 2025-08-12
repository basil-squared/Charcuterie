SMODS.Joker {
	key = 'thinner',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=57,y=0},
	cost = 5,
	
	loc_vars = function(self,info_queue,card)

		info_queue[#info_queue+1] = G.P_CENTERS.m_wild
	end,
	rarity = 2,
	

}