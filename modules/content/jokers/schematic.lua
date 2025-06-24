local get_joker_to_left = function(jokers,card)
	local index
	for i=1, #jokers do
		if jokers[i] == card then
			index = i - 1

		end
			
	end
	return index or 0
end




SMODS.Joker {
	key = "schematic",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x = 30,y=0},
	blueprint_compat = true,
	loc_txt = {
		name = "Schematic",
		text = {"Copies ability of","{C:attention}Joker{} to the left"}
	},
	rarity = 3,
	cost = 10,
	config = {extra = {retrigger_amt = 1}},
	loc_vars = function(self,info_queue,card)
		if G.jokers == nil or G.jokers.cards == nil  then
			return {}
		end
		local left_joker = G.jokers.cards[get_joker_to_left((G.jokers.cards or {}),card)]
		
		local compatible =  left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat 
		main_end = (card.area and card.area == G.jokers or {}) and {
			{
				n = G.UIT.C,
				config = {align = "bm", minh = 0.4},
				nodes = {
					{
						n = G.UIT.C,
						config = {ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY,0.8) or mix_colours(G.C.RED,G.C.JOKER_GREY,0.8), r=0.05, padding = 0.06},
						nodes = {
							{n = G.UIT.T, config = { text = '' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. '', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8} },

						}
					}
				}
			}
		} or nil
		return {main_end = main_end}
	end,
	calculate = function(self,card,context)
	
		
		local left_joker = G.jokers.cards[get_joker_to_left(G.jokers.cards,card)]

		
		return SMODS.blueprint_effect(card,left_joker,context)
		
		
	
	
		
		-- TODO: Finish this later.
	end 
}