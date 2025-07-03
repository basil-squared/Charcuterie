SMODS.Joker {
	key = 'metro_lines',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 15,y=0},
	cost = 30,
	unlocked = false,
	rarity = 'charcuterie_overclocked',
	config = { extra = {curr_xmult = 1, xmult_scale = 0.2,base_mult = 1}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.xmult_scale,card.ability.extra.curr_xmult}}
	end,
	calculate = function(self,card,context)
		if context.before and context.main_eval and not context.blueprint then
			local faces = false
			for _, playing_card in ipairs(context.scoring_hand) do
				if playing_card:is_face() then
					faces = true
					break
				end
			end
			if faces then
				local last_xm = card.ability.extra.curr_xmult
				card.ability.extra.curr_xmult = card.ability.extra.base_mult
				if last_xm > 0 then -- checks to see if scaling even started before returning reset message
					return {
						message = localize('k_reset')
					}
				end
			else
				card.ability.extra.curr_xmult = card.ability.extra.xmult_scale + card.ability.extra.curr_xmult
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.curr_xmult
			}
		end
	end,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_metro_lines'] then
			return true

		end
		return false

	end,
}