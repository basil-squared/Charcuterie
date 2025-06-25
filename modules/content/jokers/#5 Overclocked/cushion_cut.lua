SMODS.Joker {
	key = 'cushion_cut',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 13,y=0},
	config = {extra = {mult = 16}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.mult}}
	end,
	rarity = "charcuterie_overclocked",
	unlocked = false,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Clubs') then
				return {
					mult = card.ability.extra.mult
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