SMODS.Joker {
	key = "ferocious_grin",
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=0,y=0},
	cost = 30,
	rarity = "charcuterie_overclocked",
	config = {extra = {mult = 25}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.mult}}
	end,
	unlocked = false,
	locked_loc_vars = function(self,info_queue,card)

	end,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_ferocious_grin'] then
			return true

		end
		return false

	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
				return {mult = card.ability.extra.mult}

			end
		end
	end
}