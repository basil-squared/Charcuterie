SMODS.Joker {
	key = 'overclock',
	rarity = 3,
	cost = 10,
	config = {extra = {odds = 15}},
	loc_vars = function(self,info_queue,card)
		return {vars = {(G.GAME.probabilities.normal or 1),card.ability.extra.odds}}
	end,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 59,y=0},
	calculate = function(self,card,context)
		if context.card_added then
			CHAR.FUNC.change_card_values(context.card,2,'mul',false)
		end
		if context.post_trigger then
			if pseudorandom("more_power") < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
				local victim = context.other_card
				if not victim or victim == card then
					return
				end -- Safety check, and makes sure that overclock cant kill itself

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
			end
		end
		end,
	add_to_deck = function(self,card,from_debuff)
		for i=0, #G.jokers.cards do
			if G.jokers.cards[i] == card then

			else
				CHAR.FUNC.change_card_values(G.jokers.cards[i],2,'mul',false)
			end

		end

	end,
	remove_from_deck = function(self,card,from_debuff)
		for i=0, #G.jokers.cards do
			if G.jokers.cards[i] == card then

			else
				CHAR.FUNC.change_card_values(G.jokers.cards[i],2,'mul',true)
			end

		end

	end
}