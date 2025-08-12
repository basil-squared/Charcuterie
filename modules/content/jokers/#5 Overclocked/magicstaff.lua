SMODS.Joker {
	key = "magic_wand",
	cost = 30,
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=6,y=0},
	rarity = "charcuterie_overclocked",

	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key="char_txt_oc"}

	end,
	unlocked = false,
	
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_magic_wand'] then
			return true

		end
		return false

	end,
	calculate  = function(self,card,context)
		if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			G.E_MANAGER:add_event(Event({
				func = (function()
					G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.add_card {
								set = 'Spectral',
								key_append = 'charcuterie_oc'
							}
							G.GAME.consumeable_buffer = 0
							return true
						end
					}))
					SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.PURPLE},
					context.blueprint_card or card)
					return true
				end)
			}))
			return nil,true
		end
	end
}