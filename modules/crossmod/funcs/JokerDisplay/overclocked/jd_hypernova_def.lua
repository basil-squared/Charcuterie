jd_def['j_charcuterie_hypernova'] = {
	text = {
		{
			border_nodes = {
				{text = 'X'},
				{ref_table = 'card.joker_display_values', ref_value = 'xmult',}
			}
		},

	},
	calc_function = function(card)
		local text, _, _ = JokerDisplay.evaluate_hand()
		local _val = ((text ~= 'Unknown' and G.GAME and G.GAME.hands[text] and (G.GAME.hands[text].played / 2) * (next(G.play.cards) and 0 or 1))) or
				1
		if _val < 1 then
			_val = 1
		end
		_val = _val + 0.5
		card.joker_display_values.xmult = _val
	end
}