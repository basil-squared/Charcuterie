SMODS.Joker {
	key = "undefeatable",
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 26,y=0},
	cost = 30,
	config = {extra = {x_dollars = 3,will_receive = false}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.x_dollars}}
	end,
	rarity = "charcuterie_overclocked",
	unlocked = false,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_undefeatable'] then
			return true

		end
		return false

	end,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			if (hand_chips * mult) > G.GAME.blind.chips then
				card.ability.extra.will_receive = true
				return {
					message = "Active!"
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.will_receive then
			card.ability.extra.will_receive = false
			return to_big(G.GAME.dollars) * to_big(card.ability.extra.x_dollars)
		end
	end
}