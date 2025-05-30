SMODS.Consumable {
	key = "scientist",
	set = "Tarot",
	atlas = CHAR.G.tarotatlas.key,
	config = {max_highlighted = 1, mod_conv = "m_charcuterie_unstable"},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
		return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
	end,
	pos = {x=1,y=0},

}