SMODS.Joker {
	key = "mafioso",
	rarity = 3,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 46,y=0},
	config = {extra = {made_men_created = 2,xmult_gained = 0.5, total_xmult = 1.0,bxm = 1}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set = 'Other', key = 'char_txt_mafia'}
		return {vars = {card.ability.extra.made_men_created, card.ability.extra.xmult_gained, card.ability.extra.total_xmult}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			if G.GAME.blind.config.blind.key == "bl_charcuterie_bigtooth" then
				card.ability.extra.xmult_gained = 1

			end
			
			local mafiajokers = {}
			for i=1, #G.jokers.cards do
				for k,v in pairs(G.P_CENTER_POOLS["mafia"]) do
					if G.jokers.cards[i].config.center_key == v.key then
						table.insert(mafiajokers,G.jokers.cards[i])
					end
				end
			end
			if not mafiajokers[1] then
				
				SMODS.add_card({set="mafia",})
				SMODS.add_card({set="mafia",})
			end

			card.ability.extra.total_xmult = (card.ability.extra.bxm) + (card.ability.extra.xmult_gained * #mafiajokers)
			return {
				message = "Here we go.",

				colour = G.C.RED,
			}


		end
		if context.pre_joker then
			local mafiajokers = {}
			for i=1, #G.jokers.cards do
				for k,v in pairs(G.P_CENTER_POOLS["mafia"]) do
					if G.jokers.cards[i].config.center_key == v.key then
						table.insert(mafiajokers,G.jokers.cards[i])
					end
				end
			end
			card.ability.extra.total_xmult = (card.ability.extra.bxm) + (card.ability.extra.xmult_gained * #mafiajokers)
		end
		if context.joker_main and G and G.GAME and to_big(G.GAME.dollars) > to_big(0) then
			return {
				xmult = card.ability.extra.total_xmult
			}
		end


	end
}