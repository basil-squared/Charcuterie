SMODS.Joker {
	key = 'trilliant_cut',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 12,y=0},
	cost = 30,
	config = {extra = {chips = 200}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.chips}}
	end,
	rarity = "charcuterie_overclocked",
	unlocked = false,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Spades') then
				local curr_chips = to_number(to_big(mult) * to_big((card.ability.extra.chips / 100)))
				return {
					chips = curr_chips
				}
			end
		end
	end,
	check_for_unlock = function(self,args)
		if CHAR.G.Overclock_Table and CHAR.G.Overclock_Table['j_charcuterie_trilliant_cut'] then
			return true
		end
		return false
	end
}