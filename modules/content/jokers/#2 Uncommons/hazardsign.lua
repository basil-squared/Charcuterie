SMODS.Joker {
	key = "hazardsign",

	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 17,y=0},
	config = {extra = {xchips = 0.3, totalxchips = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars={self.config.extra.xchips, card.ability.extra.totalxchips}}
	end,
	rarity = 2,
	calculate = function(self,card,context)
		if context.unstable_proc  then
			card.ability.extra.totalxchips = card.ability.extra.totalxchips + card.ability.extra.xchips
			return {
				message = "Upgrade!"
			}
		end
		if context.joker_main then
			return {
				xchips = card.ability.extra.totalxchips
			}
		end
	end

}