SMODS.Joker:take_ownership('golden',{
	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_undefeatable'
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set= "Other",key="char_txt_ochint_golden"}
	end,
	calculate = function(self,card,context)
		if context.final_scoring_step then
			if (hand_chips * mult) > G.GAME.blind.chips*to_big(3) then
				CHAR.FUNC.overclock_proc({card=card,key="j_charcuterie_undefeatable"})
			end
		end

	end


},true)