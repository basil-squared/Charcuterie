SMODS.Joker:take_ownership('8_ball',{
	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_infinite_ball'
		card.ability.ext_ovr.hitcounter = 0
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = 'Other'}
	end
},true)

-- Implementation in overclockpatches.toml