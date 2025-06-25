SMODS.Joker {
	key = "brilliant_cut",
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=11,y=0},
	rarity = "charcuterie_overclocked",
	config = {extra = {xdollars = 1.2}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue +1] = {set = "Other", key = "char_txt_oc"}
		return {vars = {card.ability.extra.xdollars}}
	end,
	unlocked = false,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Diamonds') then
				local ret_dollar = to_number(to_big(G.GAME.dollars) * to_big(card.ability.extra.xdollars - 1))
				return {
					dollars = ret_dollar
				}
			end
		end
	end,
	check_for_unlock = function(self,args)
		if CHAR.G.Overclock_Table and CHAR.G.Overclock_Table['j_charcuterie_brilliant_cut'] then
			return true
		end
		return false
		end

}