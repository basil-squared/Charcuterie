SMODS.Joker {
	key = 'quasar',
	atlas = CHAR.G.jokeratlas2.key,
	pos = {x=2,y=0},
	config = {extra = {score_req = 1}, locked_extra = {cards_req = 20}},
	rarity =3,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_void
		return {
			vars = {
				card.ability.extra.score_req
			}
		}
	end,
	locked_loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_void
		return {
			vars = {
				card.ability.locked_extra.cards_req
			}
		}
	end,
	unlocked = false,
	check_for_unlock =function(self,args)
		if G and G.playing_cards then
			return CHAR.FUNC.check_enhancement_deck('m_charcuterie_void') >= 20
		end

	end,
	calculate = function(self,card,context)
		local voids = 0

		if context.joker_main then
			for k,v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(context.scoring_hand[k],'m_charcuterie_void') then
					voids = voids + 1
				end
			end
			if voids >= card.ability.extra.score_req then
				for k,v in ipairs(context.full_hand) do
					if not SMODS.in_scoring(context.full_hand[k],context.scoring_hand) then
						G.E_MANAGER:add_event(Event({
							trigger = 'immediate',

							func = function()
								context.full_hand[k].marked_for_death = true
								return true
							end
						}))
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.4,
							func = function()
								card:juice_up(0.4,0.5)
								return true
							end
						}))

					end

				end
			end
		end
		if context.destroy_card and context.destroy_card.marked_for_death then
			return {remove = true}



		end

	end


}