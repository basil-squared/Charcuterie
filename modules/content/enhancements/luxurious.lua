SMODS.Enhancement {
	key = 'luxurious',
	atlas = CHAR.G.enhancementatlas.key,
	pos = {x = 7, y= 0},
	config = {extra = {money = 4}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money}}
	end,
	calculate = function(self,card,context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				dollars = card.ability.extra.money
			}
		end
	end
}