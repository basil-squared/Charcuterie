SMODS.Back {
	key = "deflation",
	atlas = CHAR.G.deckatlas.key,
	pos = {x = 0, y = 0},
	config = { extra = {money_start = 100}},
	loc_vars = function(self, info_queue,card)
		return {vars = {self.config.extra.money_start}}
	end,
	apply = function(self,back)
		G.GAME.dollars = 100
		G.GAME.modifiers.no_blind_reward = {Small = true,Big = true, Boss= true,}
	end
}

