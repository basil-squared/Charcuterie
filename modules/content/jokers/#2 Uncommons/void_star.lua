SMODS.Joker {
	key = 'voidstar',
	atlas = CHAR.G.jokeratlas2.key,
	pos = {x=9,y=0},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_void
	end,
	rarity = 2,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.2,
					blocking = false,
					blockable = true,
					func = function()
						context.other_card:set_ability('m_charcuterie_void')
						return true
					end
				}))
			end
		end
	end
}