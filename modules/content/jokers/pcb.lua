SMODS.Joker {
	key = "pcb",
	loc_txt = {
		name = "PCB",
		text = {"Copies ability of leftmost","and rightmost Jokers."}
	},
	atlas = ASPL.G.jokeratlas.key,
	pos = {x = 33,y=0},
	rarity = 3,
	cost = 15,
	loc_vars = function(self,info_queue,card)
		if G.jokers == nil or G.jokers.cards == nil  then
			return {}
		end
		local left_joker = G.jokers.cards[1]
		local right_joker = G.jokers.cards[#G.jokers.cards]

		local compatible =  left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat
		local compatible2 = right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat
		main_end = (card.area and card.area == G.jokers or {}) and {
			{
				n = G.UIT.R,
				config = {align = "bm", minh = 0.4},
				nodes = {
					{
						n = G.UIT.R,
						config = {ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY,0.8) or mix_colours(G.C.RED,G.C.JOKER_GREY,0.8), r=0.05, padding = 0.07},
						nodes = {
							{n = G.UIT.T, config = { text = '' .. 'left: ' ..  localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. '', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8} },

						}
					},
					{
						n = G.UIT.R,
						config = {colour = G.C.UI.TEXT_LIGHT,scale=0.16*0.8,minh=0.07,align="bm"}
					},
					{
						n = G.UIT.R,
						config = {ref_table = card, align = "m", colour = compatible2 and mix_colours(G.C.GREEN, G.C.JOKER_GREY,0.8) or mix_colours(G.C.RED,G.C.JOKER_GREY,0.8), r=0.05, padding = 0.07},
						nodes = {
							{n = G.UIT.T, config = { text = '' .. 'right: ' .. localize('k_' .. (compatible2 and 'compatible' or 'incompatible')) .. '', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8} },

						}
					}
				}
			}
		} or nil
		return {main_end = main_end}
	end,
	calculate = function(self,card,context)
		local left_joker = G.jokers.cards[1]

		local right_joker = G.jokers.cards[(#G.jokers.cards or 1)]
		local ret = SMODS.blueprint_effect(card,left_joker,context)

		if ret then
			ret.colour = G.C.GREEN
			SMODS.calculate_effect(ret,card)
		end
		local ret2 = SMODS.blueprint_effect(card,right_joker,context)
		if ret2 then
			ret2.colour = G.C.GREEN
		end

		return ret2






	end
}