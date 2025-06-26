SMODS.Joker:take_ownership('j_onyx_agate',{

	add_to_deck = function(self,card,from_debuff)
		card.ability.ext_ovr = {}
		card.ability.ext_ovr.suit_req = 40
	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key = "char_txt_ochint_mineral"}
	end,
	calculate = function(self,card,context)
		if context.before then
			local count = 0

			for k,_ in pairs(G.playing_cards) do
				if G.playing_cards[k]:is_suit('Clubs') then
					count = count + 1
				end
			end
			if count >= card.ability.ext_ovr.suit_req then
				CHAR.FUNC.overclock_proc(card,'j_charcuterie_cushion_cut')
			end

		end
	end


})