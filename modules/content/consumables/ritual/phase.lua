SMODS.Consumable({
	key = "phase",
	set = "ritual",
	atlas = CHAR.G.ritualatlas.key,
	pos = { x = 2, y = 0 },

	use = function(self, card, area, copier)
		local coin_flip = pseudorandom("two-face")

		if coin_flip > 0.49 then
			local victim = G.jokers.cards[#G.jokers.cards]
			victim.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			-- If i'm to be completely honest my biggest gripe with this game is how big of a piece of shit it is to get rid of jokers.

			-- Store reference in local variable for closure
			local dissolve_target = victim
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				blockable = false,
				blocking = true,
				func = function()
					if dissolve_target and dissolve_target.start_dissolve then
						dissolve_target:start_dissolve()
					end
					G.GAME.joker_buffer = 0
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.6,
				blockable = true,
				func = function()
					G.jokers.cards[1]:set_edition("e_negative")
					G.jokers.cards[1]:juice_up()
					return true
				end,
			}))
		else
			local victim = G.jokers.cards[1]
			victim.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1

			-- Store reference in local variable for closure
			local dissolve_target = victim
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				blockable = false,
				blocking = true,
				func = function()
					if dissolve_target and dissolve_target.start_dissolve then
						dissolve_target:start_dissolve()
					end
					G.GAME.joker_buffer = 0
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.6,
				blockable = true,
				func = function()
					G.jokers.cards[#G.jokers.cards]:set_edition("e_negative")
					G.jokers.cards[#G.jokers.cards]:juice_up()
					return true
				end,
			}))
		end
	end,
	can_use = function(self, card)
		if #G.jokers.cards > 1 then
			return true
		else
			return false
		end
	end,
})
