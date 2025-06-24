SMODS.Joker {
	key = 'ripped',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=36,y=0},
	config = {extra = {xmult_gained = 0.1,total_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)

		return {vars = {card.ability.extra.xmult_gained, card.ability.extra.total_xmult}}
	end,
	rarity = 2,
	calculate = function(self,card,context)
		if context.card_killed  then
			card.ability.extra.total_xmult = card.ability.extra.total_xmult + card.ability.extra.xmult_gained
			return {
				message = localize('k_upgrade_ex')
			}
			
		end
		if context.joker_main then
			return{
				xmult = card.ability.extra.total_xmult
			}
		end
	end

}