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

SMODS.ConsumableType({
	key = "Element",
	primary_colour = HEX("7dd75a"),
	secondary_colour = HEX("436e47"),
	loc_txt = {
		name = "Element Card",
		collection = "Element Cards",
		undiscovered = {
			name = "???",
			text = {"An undiscovered Element Card.","Look for these scientific cards in the shop and booster packs!"}
		}
	}
})