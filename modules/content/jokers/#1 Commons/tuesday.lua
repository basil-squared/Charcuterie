SMODS.Joker {
	key = 'tuesday',
	config = {extra = {xmult = 3}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult}}
	end,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=75,y=0},
	calculate = function (self,card,context)
		if context.joker_main then
			if CHAR.FUNC.check_date() == "Tuesday" then
				return {
					xmult = card.ability.extra.xmult
				}

			else
				return {
					message = localize('k_nope_ex')
				}
			end
		end
	end

}