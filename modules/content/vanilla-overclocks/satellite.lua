SMODS.Joker:take_ownership('satellite',{
	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.required_increm = 9
		card.ability.ext_ovr.overclock_counterpart = "j_charcuterie_orbital_cannon"
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set= "Other",key="char_txt_ochint_mineral"}
	end,
	calculate = function(self,card,context)
		if context.using_consumeable then
			local planets = 0
			for k,v in pairs(G.GAME.consumeable_usage) do if v.set == "Planet" then planets = planets + 1 end end
			if  planets >= card.ability.ext_ovr.required_increm then
				CHAR.FUNC.overclock_proc({card =card,key =card.ability.ext_ovr.overclock_counterpart})
			end
		end
	end


},true)