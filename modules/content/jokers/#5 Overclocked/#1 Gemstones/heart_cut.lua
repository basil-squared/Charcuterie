SMODS.Joker {
	key = 'heart_cut',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 14,y=0},
	config = {extra = {xmult = 3, odds = 2}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set="Other",key="char_txt_oc"}
		local new_num, new_denom = SMODS.get_probability_vars(card,1,card.ability.extra.odds,'heart_cut')
		return {
			vars = {
				new_num,
				new_denom,
				card.ability.extra.xmult
			}
		}
	end,
	rarity = "charcuterie_overclocked",
	unlocked = false,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Hearts') and SMODS.pseudorandom_probability(card,'eruhofgwfuioggwhebgf',1,card.ability.extra.odds) then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		end
	end,
	check_for_unlock = function(self,args)
		if CHAR.G.Overclock_Table and CHAR.G.Overclock_Table['j_charcuterie_heart_cut'] then
			return true
		end
		return false
	end
}