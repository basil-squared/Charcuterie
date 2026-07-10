SMODS.ConsumableType({
	key = "ritual",
	shop_rate = 0,
	primary_colour = HEX("140100"),
	secondary_colour = HEX("570803"),
	collection_rows = {7,7},
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
	key = 'host',
	shop_rate = 0,
	primary_color = HEX("ede5d1"),
	secondary_colour = HEX("c4beaf"),
	collection_rows = {5,5},
	loc_txt = {
		name = "Host Card",
		collection = "Host Cards",
		undiscovered = {
			name = "???",
			text = { "An undiscovered Host Card.", "Nothing on its own, it needs something to hold." }
		}
	}
})

