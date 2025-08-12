SMODS.Joker {
	key = 'cushion_cut',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 13,y=0},
	cost = 30,
	config = {extra = {mult = 25}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.mult}}
	end,
	rarity = "charcuterie_overclocked",
	unlocked = false,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			local mult_given = to_number(to_big(hand_chips) / to_big(card.ability.extra.mult))
			if context.other_card:is_suit('Clubs') then

				return {
					mult = mult_given
				}
			end
		end
	end,
	check_for_unlock = function(self,args)
		if CHAR.G.Overclock_Table and CHAR.G.Overclock_Table['j_charcuterie_cushion_cut'] then
			return true
		end
		return false
	end
}