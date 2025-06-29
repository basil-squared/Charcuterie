jd_def["j_charcuterie_brilliant_cut"] = {
	text = {
		{ref_table = "card.joker_display_values", ref_value = "count",retrigger_type = mult},
		{text = "x"},
		{
			border_nodes = {
				{text = "X"},
				{ref_table = "card.ability.extra",ref_value = "xdollars"}
			},
			border_colour = G.C.MONEY,
		}
	},
	reminder_text = {
		{text = "("},
		{ref_table = "card.joker_display_values",ref_value="localized_text",colour = lighten(G.C.SUITS['Diamonds'],0.35)},
		{text = ")"}
	},
	extra = {
		{
			{text = "(", scale = 0.3,colour = G.C.UI.TEXT_INACTIVE},
			{text = "+$", scale = 0.3,colour = G.C.MONEY},
			{ref_table = "card.joker_display_values", ref_value = "tot_dollars", colour = G.C.MONEY,scale = 0.3},
			{text = ")",scale=0.3,colour = G.C.UI.TEXT_INACTIVE}
		}

	},
	calc_function = function(card)
		local dollars_at_start = to_big(G.GAME.dollars)
		local total_dollars = 0
		local count = 0
		if G.play then
			local text,_,scoring_hand = JokerDisplay.evaluate_hand()
			if text ~= 'Unknown' then
				for _,scoring_card in pairs(scoring_hand) do
					if scoring_card:is_suit('Diamonds') then
						count = count +
								JokerDisplay.calculate_card_triggers(scoring_card,scoring_hand)
					end

				end
				total_dollars = to_big(count) * (dollars_at_start * (to_big(card.ability.extra.xdollars) - to_big(1)))
			end
		else
			count = 3

		end
		card.joker_display_values.count = count
		card.joker_display_values.tot_dollars = total_dollars
		card.joker_display_values.localized_text = localize("Diamonds",'suits_plural')
	end

}