SMODS.Joker:take_ownership('bootstraps',{
	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_snowballs_chance'
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('bootstraps')
	end,
	calculate = function(self,card,context)
		if to_big(G.GAME.dollars + (G.GAME.dollar_buffer or 0)) <= to_big(-20) then
			CHAR.FUNC.overclock_proc({
				card=card,
				key = card.ability.ext_ovr.overclock_counterpart,
			})
			ease_dollars(25)
		end
	end
},true)