SMODS.Joker:take_ownership('j_arrowhead',{

	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.suit_req = 40
		card.ability.ext_ovr.overclock_counterpart = "j_charcuterie_trilliant_cut"
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('mineral')
	end,
	calculate = function(self,card,context)
		if context.before then
			local count = 0

			for k,_ in pairs(G.playing_cards) do
				if G.playing_cards[k]:is_suit('Spades') then
					count = count + 1
				end
			end
			if count >= card.ability.ext_ovr.suit_req then
				CHAR.FUNC.overclock_proc({card =card,key =card.ability.ext_ovr.overclock_counterpart})
			end

		end
	end


},true)