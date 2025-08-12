SMODS.Joker {
	key = "theusual",
	atlas = CHAR.G.jokeratlas.key,
	pos ={x=52,y=0},
	rarity = 2,
	cost =5,

	config = {extra = {xmult = 2}},
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {
			vars = { self.config.extra.xmult, CHAR.FUNC.fetch_most_played()}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			
			if context.scoring_name == CHAR.FUNC.fetch_most_played() then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		end
	end

}

