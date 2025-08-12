jd_def['j_charcuterie_cushion_cut'] = {
	text = {
		{ref_table = "card.joker_display_values",ref_value = "count",retrigger_type = "mult"},
		{text="x"},
		{
			border_nodes = {
				{ref_table = "card.ability.extra", ref_value="mult",colour = G.C.UI.TEXT_DARK},
				{text = "%",colour = G.C.UI.TEXT_DARK},


			},
			border_colour = G.C.CHIPS,
		}
	},
	reminder_text = {
		{text = "("},
		{ref_table = "card.joker_display_values",ref_value = "localized_text",colour = lighten(G.C.SUITS['Clubs'],0.35)},
		{text = ")"}
	},
	extra = {
		{text = "("},
		{ref_table = "card.joker_display_values",ref_value = "curr_calchip",colour = G.C.CHIPS},
		{text = ")"}
	},
	extra_config = {scale = 0.3},
	calc_function = function(card)
			local count = 0
			local curr_chips = 0
			local chips_2b = 0
		if G.play then
			local text,_,scoring_hand = JokerDisplay.evaluate_hand()
			if text ~= 'Unknown' then

				for _,v in pairs(scoring_hand) do
					if v:is_suit("Clubs") then
						chips_2b = chips_2b + v:get_chip_bonus()

						count = count + JokerDisplay.calculate_card_triggers(v,scoring_hand)
						
					end
					
				end


			end
		else
			count = 3
		end
		chips_2b = chips_2b / 4
		card.joker_display_values.count = count
		card.joker_display_values.curr_calchip = chips_2b
		card.joker_display_values.localized_text = localize("Clubs",'suits_plural')
	end



}