SMODS.Consumable {
	set = "Spectral",
	key = "boost_circuit",
	pos = {x=9,y=0},
	atlas = CHAR.G.tarotatlas.key,

	soul_set = 'Tarot',
	use = function(self,card,area,copier)
		CHAR.FUNC.overclock_proc({card=G.jokers.highlighted[1],force=true})
	end,
	can_use = function(self,card)
		return G.jokers.highlighted[1] and G.jokers.highlighted[1].ability.ext_ovr and G.jokers.highlighted[1].ability.ext_ovr.overclock_counterpart
	end
}