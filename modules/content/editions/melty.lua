SMODS.Edition {
	key = "melty",
	shader = "melty",
	config = {extra = {granted_mult = 3}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set = "Other", key = "aspl_txt_risk"}
		return {vars = {tostring((1 - (G.GAME.Risk or 0) ) * 100),self.config.extra.granted_mult, tostring((G.GAME.Risk or 0) * 100)}}

	end
}