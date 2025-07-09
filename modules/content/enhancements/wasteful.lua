SMODS.Enhancement {
	key = 'wasteful',
	atlas = CHAR.G.enhancementatlas.key,
	pos = {x=9,y=0},
	config = {extra= {dollars_given = 4}},
	loc_vars = function(self,info_queue,card)
		return {
			vars = {
				card.ability.extra.dollars_given
			}
		}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.discard then
			return {
				dollars = card.ability.extra.dollars_given
			}
		end
	end
}