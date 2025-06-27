--[[ THIS IS UNFINISHED!
SMODS.Joker {
	key = 'bunker',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=24,y=0},
	config = {extra={xchip_scale = 0.2,curr_xchip = 1}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.xchip_scale,(G.GAME.current_round.curr_bunker_card and G.GAME.current_round.curr_bunker_card.suit or 'Spades'),(card.ability.old_extra and card.ability.old_extra.chips or 0),card.ability.extra.curr_xchip}}
	end,
	unlocked = false,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_bunker'] then
			return true

		end
		return false

	end,
	calculate = function(self,card,context)
		if context.discard and not context.blueprint and not context.other_card.debuff and
				context.other_card:is_suit((G.GAME.current_round.curr_bunker_card and G.GAME.current_round.curr_bunker_card.suit or 'Spades')) then
			card.ability.extra.curr_xchip = card.ability.extra.curr_xchip + card.ability.extra.xchip_scale
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS
			}
		end
		if context.joker_main then
			if card.ability.old_extra then
				return {
					chips = card.ability.old_extra.chips,
					xchips = card.ability.extra.curr_xchip
				}
			end
			return {xchips = card.ability.extra.curr_xchip}
		end

	end

}

]]

