jd_def['j_charcuterie_snowballs_chance'] = {
	text = {
		{


		border_nodes = {
			{text='X'},
			{ref_table = 'card.ability.extra', ref_value = 'curr_mult'}
		}
		}
	},
	reminder_text = {
		{border_nodes = {{text = 'X', colour = G.C.WHITE}, {ref_table = 'card.ability.extra', ref_value = 'mult_gain',colour = G.C.WHITE}}},
		{text = ' for every'},
		{text = ' $',colour = G.C.MONEY},
		{ref_table = 'card.ability.extra', ref_value = 'dollar_increm', colour = G.C.MONEY}
	}
}