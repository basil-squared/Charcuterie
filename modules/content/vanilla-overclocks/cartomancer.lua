SMODS.Joker:take_ownership('cartomancer',{
	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.overclock_counterpart = "j_charcuterie_magic_wand"
		end,
	calculate = function(self,card,context)
		if context.using_consumeable then
			if context.consumeable.ability.set == "Spectral" then
				card.ability.ext_ovr.spectral_used = card.ability.ext_ovr.spectral_used + 1
			end
			if card.ability.ext_ovr.spectral_used >= 10 then
				CHAR.FUNC.overclock_proc({card =card,key =card.ability.ext_ovr.overclock_counterpart})
			end
		end
	end,
	
},true)