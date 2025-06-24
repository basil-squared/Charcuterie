SMODS.Consumable({
	key = "ritual_bloodpact",
	set = "ritual",
	atlas = ASPL.G.ritualatlas.key,
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