SMODS.Joker {
	key = 'delirium',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 3,y=0},
	config = {extra = {curr_xm = 1,xm_scale = 1,}},
	unlocked = false,
	rarity = 'charcuterie_overclocked',
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_delirium'] then
			return true

		end
		return false

	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue +1 ] = {set='Other',key='char_txt_oc'}
		return { vars = { card.ability.extra.xm_scale,card.ability.extra.curr_xm}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind and not context.blueprint and not context.blind.boss then
			local victims = {}
			for k,v in pairs(G.jokers.cards) do
				if G.jokers.cards[k]:can_calculate() and not G.jokers.cards[k].ability.eternal then
					victims[k] = v
				end

			end
			local victim = pseudorandom_element(victims,pseudoseed('Cupcakes'))
			if not victim then
				return
			end
			victim.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			local dissolve_target = victim
			G.E_MANAGER:add_event(Event({
				trigger = "immediate",
				blockable = false,
				func = function()
					if dissolve_target and dissolve_target.start_dissolve then
						dissolve_target:start_dissolve()
					end
					G.GAME.joker_buffer = 0
					return true
				end,

			}))
			card.ability.extra.curr_xm = card.ability.extra.xm_scale
			return {
				message = localize('k_upgrade_ex')
			}
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.curr_xm,
				xchips = card.ability.extra.curr_xm
			}
		end

	end
}