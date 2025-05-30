SMODS.Consumable {
	key = "explorer",
	set = "Tarot",
	atlas = CHAR.G.tarotatlas.key,
	config = {max_highlighted = 2, mod_conv = "m_charcuterie_galactical"},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
		return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
	end,
	pos = {x=0,y=0},

}