SMODS.Consumable {
	key = 'riptide',
	set = 'ritual',
	atlas = CHAR.G.ritualatlas.key,
	pos = {x = 4, y = 1},
	config = {extra = {seal = 'Blue'},max_highlighted = 3},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_SEALS[card.ability.extra.seal]
		return {vars = {card.ability.max_highlighted}}
	end,
	use = function(self,card,area,copier)
		local eligible = {}

		for k,v in ipairs(G.jokers.cards) do
			if G.jokers.cards[k].can_calculate and not G.jokers.cards[k].getting_sliced then
				eligible[#eligible + 1] = v
			end

		end
		if not eligible[1] then
			return
		end
		local selected_joker = pseudorandom_element(eligible,pseudoseed('blahblahblah'))
		selected_joker.getting_sliced = true
		G.GAME.joker_buffer = G.GAME.joker_buffer - 1
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				if selected_joker and selected_joker.start_dissolve then
					selected_joker:start_dissolve()

				end
				return true
			end
		}))
		for k,_ in ipairs(G.hand.highlighted) do
			local conv_card = G.hand.highlighted[k]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound('tarot1')
					card:juice_up(0.3,0.5)
					return true
				end
			}))
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.1,
				func = function()
					conv_card:set_seal(card.ability.extra.seal,nil,true)
					return true

				end
			}))


		end
		delay(0.5)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.2,
			func = function()
				G.hand:unhighlight_all()
				return true
			end
		}))


	end,
	can_use = function(self,card)
		local eligible_jokers = false
		for k,v in ipairs(G.jokers.cards) do
			if G.jokers.cards[k].can_calculate and not G.jokers.cards[k].getting_sliced then
				eligible_jokers = true
			end
		end
		return G.hand and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0 and eligible_jokers
	end
}