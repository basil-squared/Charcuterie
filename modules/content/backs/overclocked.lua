SMODS.Back {
	key = 'turbo',
	config = {ante_scaling = 4},
	loc_vars = function(self,info_queue,back)
		return {vars = {back.ability.ante_scaling}}
	end,
	atlas = CHAR.G.deckatlas.key,
	pos = {x=3,y=0},


}