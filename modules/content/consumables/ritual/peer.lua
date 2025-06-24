SMODS.Consumable({
	key = "peer",
	set = "ritual",
	atlas = CHAR.G.ritualatlas.key,
	pos = { x = 4, y = 0 },

	use = function(self, card, area, copier)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end

		local victim = pseudorandom_element(potential_victims, pseudoseed("I LOVE AMONG US"))
		if not victim then
			return
		end -- Safety check

		victim.getting_sliced = true
		G.GAME.joker_buffer = G.GAME.joker_buffer - 1

		-- Store reference in local variable for closure
		local dissolve_target = victim
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			blockable = false,
			func = function()
				if dissolve_target and dissolve_target.start_dissolve then
					dissolve_target:start_dissolve()
				end
				G.GAME.joker_buffer = 0
				return true
			end,
		}))
		--[[ And Thus begins  the part where i purify the cards. I'm not worried for if they are cursed or not, thats checked in can_use...
    -- Now, in a perfect world only cursed cards will be selected, but I'll make sure that the cards are cursed before operating on them.--]]
		for i = 1, #G.hand.highlighted do
			if SMODS.has_enhancement(G.hand.highlighted[i], "m_charcuterie_cursed") then
				G.hand.highlighted[i]:juice_up(0.3, 1)
				G.hand.highlighted[i]:set_ability("m_charcuterie_purified")
			end
		end
	end,
	can_use = function(self, card)
		if #G.hand.highlighted <= 2 then
			if
			(G.hand.highlighted[1] and SMODS.has_enhancement(G.hand.highlighted[1], "m_charcuterie_cursed"))
							or (G.hand.highlighted[2] and SMODS.has_enhancement(G.hand.highlighted[2], "m_charcuterie_cursed"))
			then
				return #G.jokers.cards > 0
			end
		end
	end,
})
