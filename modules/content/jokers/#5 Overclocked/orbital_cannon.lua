SMODS.Joker {
	key = "orbital_cannon",
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 7, y=0},
	unlocked = false,
	cost = 30,
	config = {extra = {xmult_gain = 0.5, total_xmult = 1}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set ="Other",key ="char_txt_oc"}
		return {vars = {card.ability.extra.xmult_gain,card.ability.extra.total_xmult}}
	end,
	rarity = "charcuterie_overclocked",
	calculate = function(self,card,context)
		if context.using_consumeable then
			if context.consumeable.ability.set == "Planet" then
				local most_played = CHAR.FUNC.fetch_most_played()
				if context.consumeable.ability.hand_type ~= most_played then
					card.ability.extra.total_xmult = card.ability.extra.xmult_gain + card.ability.extra.total_xmult
					return {
						message = localize('k_upgrade_ex')
					}
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.total_xmult
			}
		end
		end,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_orbital_cannon'] then
			return true

		end
		return false

	end,
}