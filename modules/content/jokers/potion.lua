SMODS.Joker {
	key = "potion",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=31,y=0},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,

}