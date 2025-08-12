jd_def['j_charcuterie_trilliant_cut'] = {
    text = {
        {ref_table = 'card.joker_display_values',ref_value = "count",retrigger_type = mult},
        {text='x'},
        {
            border_nodes = {
                {ref_table = 'card.ability.extra',ref_value = 'chips',colour = G.C.UI.TEXT_DARK},
                {text = '%', colour = G.C.UI.TEXT_DARK}
            },
            border_colour = G.C.MULT,
        }
    },
    reminder_text = {
		{text = "("},
		{ref_table = "card.joker_display_values",ref_value = "localized_text",colour = lighten(G.C.SUITS['Spades'],0.35)},
		{text = ")"}
	},
    calc_function = function(card)
        local count = 0
        if G.play then
			local text,_,scoring_hand = JokerDisplay.evaluate_hand()
			if text ~= 'Unknown' then

				for _,v in pairs(scoring_hand) do
					
                    if v:is_suit('Spades') then
                        count = count + JokerDisplay.calculate_card_triggers(v,scoring_hand)
                    end
					
				end


			end
		else
			count = 3
		end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = localize("Spades",'suits_plural')
    end
}