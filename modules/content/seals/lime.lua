SMODS.Seal {
	key = "lime",
	config = {extra = {chance = 20}},
	loc_vars = function(self,info_queue,card)
		return {vars = {(G.GAME.probabilities.normal or 1), self.config.extra.chance}}
	end,
	badge_colour = HEX('7dd75a'),
	atlas = ASPL.G.sealatlas.key,
	pos = {x=1,y=0}
}