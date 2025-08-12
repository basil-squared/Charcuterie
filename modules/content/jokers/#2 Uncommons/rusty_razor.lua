local get_joker_to_left = function(jokers,card)
	local index
	for i=1, #jokers do
		if jokers[i] == card then
			index = i - 1

		end

	end
	return index or 0
end

local get_joker_to_right = function(jokers,card)
	local index
	for i=1, #jokers do
		if jokers[i] == card then
			index = i + 1

		end

	end
	return index or 0
end

SMODS.Joker {
	key = 'rusty_razor',
	config = {extra = {mult = 3, odds = 15, base_mult = 1, curr_mult = to_big(0)}},
	loc_vars = function(self,info_queue,card)
		local new_num,new_denom = SMODS.get_probability_vars(card,1,card.ability.extra.odds,'razor')
		return {
			vars = {
				card.ability.extra.mult, 
				new_num, 
				new_denom,
				card.ability.extra.curr_mult
			}
		}
	end,
	rarity = 2,
	cost = 5,
	atlas = CHAR.G.jokeratlas.key,
	pos = { x = 67,y=0},
	calculate = function(self,card,context)
		if context.setting_blind then
			if SMODS.pseudorandom_probability(card,'wp0r9igwj8ip',1,card.ability.extra.odds) then
				local victim = card
				if not victim then
					return
				end -- Safety check

				victim.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1

				-- Store reference in local variable for closure
				local dissolve_target = victim
				SMODS.calculate_effect({message = localize("k_nope_ex")},card)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 2.5,
					blockable = false,
					func = function()
						if dissolve_target and dissolve_target.start_dissolve then
							dissolve_target:start_dissolve()
						end
						G.GAME.joker_buffer = 0
						return true
					end,
				}))
			else -- TODO: PLEASE PLEASE PLEASE CHANGE THIS TO THE NEW SYSTEM THIS SHIT SUCKS SO BAD
				
				local comb_sell = to_big(0)
				
				local victim1 = G.jokers.cards[get_joker_to_left(G.jokers.cards,card)]
				local victim2 = G.jokers.cards[get_joker_to_right(G.jokers.cards,card)]
				if victim1 then

					comb_sell = comb_sell + to_big(victim1.sell_cost)
					SMODS.destroy_cards(victim1)
				end
				if victim2 then
					comb_sell = comb_sell + to_big(victim2.sell_cost)
					SMODS.destroy_card(victim2)
					
				end
				
				comb_sell = comb_sell * to_big(card.ability.extra.mult)
				
				card.ability.extra.curr_mult = card.ability.extra.curr_mult + comb_sell
				return {
					message = "+" .. comb_sell .. " Mult",
					colour = G.C.RED
				}


			end

		end
		if context.joker_main then
			return {
				mult = card.ability.extra.curr_mult
			}
		end
	end
}