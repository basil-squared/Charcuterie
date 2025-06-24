SMODS.Joker {
	key = "mafioso",
	rarity = 3,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 46,y=0},
	config = {extra = {made_men_created = 2,xmult_gained = 0.5, total_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set = 'Other', key = 'char_txt_mafia'}
		return {vars = {card.ability.extra.made_men_created, card.ability.extra.xmult_gained, card.ability.extra.total_xmult}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			if G.GAME.blind.config.blind.key == "bl_charcuterie_bigtooth" then
				card.ability.extra.xmult_gained = 1

			end
			play_sound("charcuterie_mafioso_summon")
			SMODS.add_card({set="mafia",})
			SMODS.add_card({set="mafia",})
			local mafiajokers = {}
			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].pools and G.jokers.cards[i].pools["mafia"] then
					mafiajokers[i] = G.jokers.cards[i]
				end
			end
			card.ability.extra.total_xmult = (card.ability.extra.total_xmult) + (card.ability.extra.xmult_gained * #mafiajokers)
			return {
				message = "Here we go.",

				colour = G.C.RED,
			}


		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.total_xmult
			}
		end


	end
}