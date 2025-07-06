SMODS.Joker:take_ownership('ride_the_bus',{
	add_to_deck = function(self,card,context)
		card.ability.ext_ovr = {}
		-- Some of the code in this joker is in a lovely patch. :)

		card.ability.ext_ovr.mult_req = 30
		card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_metro_lines'
	end,

	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] =  CHAR.FUNC.ochint_mgr('rtb')

	end,


},true)