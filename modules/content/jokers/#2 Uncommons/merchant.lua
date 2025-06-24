SMODS.Joker {
	key = 'dubious_merchant',
	rarity = 2,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 77, y = 0},
	config = {extra ={lower_ceiling = -2, upper_ceiling = 3,curr_ceiling = 0,oc_incompatible = true }},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key = "char_txt_immobile"}
		return {vars = {card.ability.extra.lower_ceiling, card.ability.extra.upper_ceiling,card.ability.extra.curr_ceiling}}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.cardarea == G.jokers then
			local new_sze = round_number(pseudorandom("griouoirg",card.ability.extra.lower_ceiling,card.ability.extra.upper_ceiling),0)
			change_shop_size(-card.ability.extra.curr_ceiling)
			card.ability.extra.curr_ceiling = new_sze
			change_shop_size(card.ability.extra.curr_ceiling)
			return {
				message = localize('k_reset')
			}
		end
	end,
	remove_from_deck = function(self,card,from_debuff)
		change_shop_size(-card.ability.extra.curr_ceiling)
	end
}