local plg_lc = SMODS.Atlas({
	key = "plg_lc",
	path = "plg_lc.png",
	px = 71,
	py = 95,
})

local plg_hc = SMODS.Atlas({
	key = "plg_hc",
	path = "plg_hc.png",
	px = 71,
	py = 95,
})

SMODS.DeckSkin({
	key = "perfectlightgaia",
	suit = "Spades",
	loc_txt = "Perfect Light Gaia",
	palettes = {
		{
			key = "lc",
			ranks = { "Jack", "Queen", "King" },
			display_ranks = { "King", "Queen", "Jack" },
			atlas = plg_lc.key,
			pos_style = "collab",
		},
		{
			key = "hc",
			ranks = { "Jack", "Queen", "King" },
			display_ranks = { "King", "Queen", "Jack" },
			atlas = plg_hc.key,
			pos_style = "collab",
			color = HEX("9D00FF"),
		},
	},
})
