SMODS.Joker {
	key = "007n7",
	config = {extra = {rounds_required = 5, rounds_remain = 5}},
	loc_vars = function(self,info_queue,card)

		return {vars = {card.ability.extra.rounds_required,card.ability.extra.rounds_remain}}  end,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=42,y=0},
	rarity = 2,
	calculate = function(self,card,context) -- cloning code "borrowed" from vanilla remade's invis joker, with changes to fit this usecase
		if context.end_of_round and context.cardarea == G.jokers then
			if card.ability.extra.rounds_remain == 1 then
				local jokers = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card then
						jokers[#jokers + 1] = G.jokers.cards[i]
					end
				end
				if #jokers > 0 then
					if #G.jokers.cards <= G.jokers.config.card_limit then
						local chosen_joker = pseudorandom_element(jokers, pseudoseed('007n7'))
						local copied_joker = copy_card(chosen_joker, nil, nil, nil,
								chosen_joker.edition and chosen_joker.edition.negative)

						copied_joker:set_perishable(true)
						copied_joker:add_to_deck()
						G.jokers:emplace(copied_joker)
						card.ability.extra.rounds_remain = 5
						return { message = localize('k_duplicated_ex') }
					else
						return { message = localize('k_no_room_ex') }
					end

				end



				-- Behavior
			else
				card.ability.extra.rounds_remain = card.ability.extra.rounds_remain -1
				return {
					message = tostring(card.ability.extra.rounds_remain) .. " Remaining",
					colour = G.C.RED
				}
			end
			end
	end
}