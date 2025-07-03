SMODS.Joker {
	key = 'hypernova',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=25,y=0},
	config = {extra={xmult=0.5}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set='Other',key='char_txt_oc'}
		return {vars = {card.ability.extra.xmult}}
	end,
	rarity = 'charcuterie_overclocked',
	cost = 30,
	unlocked = false,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_hypernova'] then
			return true

		end
		return false

	end,
	calculate = function(self,card,context)
		if context.joker_main then
			local total_xm = to_big(card.ability.extra.xmult) * to_big(G.GAME.hands[context.scoring_name].played)
			if total_xm < to_big(1) then
				total_xm = nil
			end
			return {
				xmult = (total_xm or nil)
			}
		end

	end
}