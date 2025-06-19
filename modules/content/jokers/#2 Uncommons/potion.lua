SMODS.Joker {
	key = "potion",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=31,y=0},
	rarity = 2,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,
	calculate = function(self,card,context)
		if context.selling_self then
			if CHAR.FUNC.negative_event_proc((G.GAME.Risk or 0)) then
				local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                if #G.jokers.cards <= G.jokers.config.card_limit then
                    local chosen_joker = assert(pseudorandom_element(jokers, pseudoseed('vremade_invisible')))
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil,
                        chosen_joker.edition and chosen_joker.edition.negative)
                    copied_joker:add_to_deck()
                    G.jokers:emplace(copied_joker)
                    return { message = localize('k_duplicated_ex') }
                else
                    return { message = localize('k_no_room_ex') }
                end
            else
                return { message = localize('k_no_other_jokers') }
            end
			else
				return {
					 message = localize('k_nope_ex')
				}
			end
            
			
        end
	end

}