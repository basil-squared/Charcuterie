SMODS.Back {
	key = "hardcore",
	atlas = CHAR.G.deckatlas.key,
	pos = { x =2 , y = 0},
    config = { extra = {dollars_given  = 50},consumables = { 'c_soul','c_ectoplasm' }},
    loc_vars = function(self,info_queue,card) return {vars = {self.config.extra.dollars_given}} end,
	apply = function(self,back)
		G.GAME.dollars = 50
        
		
	end

}