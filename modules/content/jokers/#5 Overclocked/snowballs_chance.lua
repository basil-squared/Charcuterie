SMODS.Joker {
	key = 'snowballs_chance',
	pos = {x =21,y=0},
	cost = 30,
	atlas = CHAR.G.overclockedatlas.key,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_snowballs_chance'] then
			return true

		end
		return false

	end,
	config = {extra = {mult_gain = 0.5, curr_mult = 1,dollar_increm = 4}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key = "char_txt_oc"}
		return { vars = {card.ability.extra.mult_gain,card.ability.extra.dollar_increm,to_big(card.ability.extra.mult_gain)* math.floor(((to_big(G.GAME.dollars or 0) + (to_big(G.GAME.dollar_buffer or 0))) + to_big(G.GAME.dollar_buffer or 0) / to_big(card.ability.extra.dollar_increm)))/2+1}}
	end,
	rarity = 'charcuterie_overclocked',
	calculate = function(self,card,context)
		if context.joker_main then return { xmult = to_big(card.ability.extra.mult_gain)* math.floor(((to_big(G.GAME.dollars or 0) + (to_big(G.GAME.dollar_buffer or 0))) + to_big(G.GAME.dollar_buffer or 0) / to_big(card.ability.extra.dollar_increm*2)))/2+1} end
	end,
	unlocked = false
}