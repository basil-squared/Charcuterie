local ritualatlas = SMODS.Atlas({
	key = "ritual_atlas",
	path = "ritualatlas.png",
	px = 71,
	py = 95,
})

SMODS.ConsumableType({
	key = "ritual",
	primary_colour = HEX("140100"),
	secondary_colour = HEX("570803"),
	loc_txt = {
		name = "Ritual Card", -- used on card type badges
		collection = "Ritual Cards", -- label for the button to access the collection
		undiscovered = { -- description for undiscovered cards in the collection
			name = "???",
			text = { "An undiscovered Ritual Card.", "Keep your eyes peeled for these powerful, yet costly cards..." },
		},
	},
})
SMODS.Consumable({
	key = "ritual_strike",
	set = "ritual",
	atlas = ritualatlas.key,
	pos = { x = 3, y = 0 },
	loc_txt = {
		name = "Strike",
		text = { "{C:red}Curse{} your hand.", "Earn {C:attention}$5{} for every card Cursed." },
	},

	use = function(self, card, area, copier)
		for i = 1, #G.hand.cards do
			G.hand.cards[i]:juice_up(0.1, 1)
			G.hand.cards[i]:set_ability("m_astropulvis_cursed")
			ease_dollars(5)
		end
	end,

	can_use = function(self, card)
		if G.STATE == G.STATES.SELECTING_HAND then
			return true
		else
			return false
		end
	end,
})
SMODS.Consumable({
	key = "ritual_bloodpact",
	set = "ritual",
	atlas = ritualatlas.key,
	pos = { x = 0, y = 0 },
	loc_txt = {
		name = "Blood Pact",
		text = { "Spawn a random {C:red}Eternal Rare{} Joker." },
	},
	use = function(self, card, area, copier)
		local tempjok = SMODS.add_card({ set = "Joker", rarity = 1, stickers = { "eternal" } })

		tempjok:set_eternal(true)
	end,
	can_use = function(self, card)
		if #G.jokers.cards >= G.jokers.config.card_limit then
			return false
		else
			return true
		end
	end,
})

SMODS.Consumable({
	key = "ritual_sever",
	set = "ritual",
	atlas = ritualatlas.key,
	pos = { x = 1, y = 0 },
	loc_txt = {
		name = "Sever",
		text = { "{C:red}Destroy{} a random Joker.", "Summon 2 {C:red}Ritual Cards{}." },
	},
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

		--[[So, funny shit here, consumables is misspelt in the code of the game, so just remember..]]
		local slots_available = G.consumeables.config.card_limit - #G.consumeables.cards
		if slots_available >= 2 then
			SMODS.add_card({ set = "ritual" })
			SMODS.add_card({ set = "ritual" })
		elseif slots_available == 1 then
			SMODS.add_card({ set = "ritual" })
		end
	end,

	can_use = function(self, card)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end
		return #potential_victims > 0 and #G.consumeables.cards < G.consumeables.config.card_limit
	end,
})

SMODS.Consumable({
	key = "ritual_juxt",
	set = "ritual",
	atlas = ritualatlas.key,
	pos = { x = 2, y = 0 },
	loc_txt = {
		name = "Phase",
		text = {
			"{C:mult} Destroy{} the {C:attention}Leftmost{} or {C:attention}Rightmost{} Joker.",
			"Add {C:dark_edition}Negative{} to the other.",
		},
	},
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

SMODS.Consumable({
	key = "ritual_peer",
	set = "ritual",
	atlas = ritualatlas.key,
	pos = { x = 4, y = 0 },
	loc_txt = {
		name = "Peer",
		text = {
			"{C:red}Destroy{} a random joker.",
			"{C:astropulvis_purified}Purify{} 2 selected {C:red}Cursed{} cards.",
		},
	},
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
			if SMODS.has_enhancement(G.hand.highlighted[i], "m_astropulvis_cursed") then
				G.hand.highlighted[i]:juice_up(0.3, 1)
				G.hand.highlighted[i]:set_ability("m_astropulvis_purified")
			end
		end
	end,
	can_use = function(self, card)
		if #G.hand.highlighted <= 2 then
			if
				(G.hand.highlighted[1] and SMODS.has_enhancement(G.hand.highlighted[2], "m_astropulvis_cursed"))
				or (G.hand.highlighted[2] and SMODS.has_enhancement(G.hand.highlighted[i], "m_astropulvis_cursed"))
			then
				return #G.jokers.cards > 0
			end
		end
	end,
})
