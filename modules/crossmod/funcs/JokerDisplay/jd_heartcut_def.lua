jd_def["j_charcuterie_heart_cut"] = {
	text = {
		{ ref_table = "card.joker_display_values", ref_value = "count",retrigger_type = "mult"},
		{ text = "x",                              scale = 0.35},
		{
			border_nodes = {
				{ text = "X"},
				{ ref_table = "card.ability.extra",ref_value = "xmult"}
			}
		}
	},
	reminder_text = {
		{text = "("},
		{ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Hearts"], 0.35)},
		{text = ")"}
	},
	extra = {
		{
			{text = "("},
			{ref_table = "card.joker_display_values", ref_value = "odds"},
			{text = ")"},
		}
	},
	extra_config = {colour = G.C.GREEN, scale = 0.3},
	calc_function = function(card)
		local count = 0
		if G.play then
			local text, _, scoring_hand = JokerDisplay.evaluate_hand()
			if text ~= 'Unknown' then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card:is_suit('Hearts') then
						count = count +
								JokerDisplay.calculate_card_triggers(scoring_card,scoring_hand)
					end
				end
			end
		else
			count = 3
		end
		card.joker_display_values.count = count
		card.joker_display_values.odds = localize { type = 'variable',key = 'jdis_odds',vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
		card.joker_display_values.localized_text = localize("Hearts",'suits_plural')
	end

}
