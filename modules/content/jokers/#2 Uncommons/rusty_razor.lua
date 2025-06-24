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
		return {vars = {card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds,card.ability.extra.curr_mult}}
	end,
	rarity = 2,
	atlas = CHAR.G.jokeratlas.key,
	pos = { x = 67,y=0},
	calculate = function(self,card,context)
		if context.setting_blind then
			if pseudorandom('tetanus') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
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
			else
				local diss_trg1
				local comb_sell = to_big(0)
				local diss_trg2
				local victim1 = G.jokers.cards[get_joker_to_left(G.jokers.cards,card)]
				local victim2 = G.jokers.cards[get_joker_to_right(G.jokers.cards,card)]
				if victim1 then

					comb_sell = comb_sell + to_big(victim1.sell_cost)
					diss_trg1 = victim1
					G.GAME.joker_buffer = G.GAME.joker_buffer - 1
					diss_trg1.getting_sliced = true
				end
				if victim2 then
					comb_sell = comb_sell + to_big(victim2.sell_cost)
					diss_trg2 = victim2
					G.GAME.joker_buffer = G.GAME.joker_buffer - 1
					diss_trg2.getting_sliced = true
				end
				G.E_MANAGER:add_event(Event({
					trigger = "immediate",
					blockable = false,
					func = function()
						if diss_trg1 and diss_trg1.start_dissolve then
							diss_trg1:start_dissolve()
						end
						if diss_trg2  and diss_trg2.start_dissolve then
							diss_trg2:start_dissolve()
						end
						G.GAME.joker_buffer = 0
						return true
					end,
				}))
				comb_sell = comb_sell * to_big(card.ability.extra.mult)
				print(comb_sell)
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