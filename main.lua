SMODS.current_mod.optional_features = {
	cardareas = {
		unscored = true,
	},
}

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/consumables.lua"))()
assert(SMODS.load_file("src/blinds.lua"))()
assert(SMODS.load_file("src/utils.lua"))()
assert(SMODS.load_file("src/risk.lua"))()
assert(SMODS.load_file("src/ui.lua"))()
assert(SMODS.load_file("src/backs.lua"))()
local chrono_lc = SMODS.Atlas({
	key = "chrono_lc",
	path = "chrono_lc.png",
	px = 71,
	py = 95,
})

local chrono_hc = SMODS.Atlas({
	key = "chrono_hc",
	path = "chrono_hc.png",
	px = 71,
	py = 95,
})

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
	key = "chronophobia",
	suit = "Hearts",
	loc_txt = "Chronophobia",
	palettes = {
		{
			key = "lc",
			ranks = { "Jack", "Queen", "King" },
			display_ranks = { "King", "Queen", "Jack" },
			atlas = chrono_lc.key,
			pos_style = "collab",
		},
		{
			key = "hc",
			ranks = { "Jack", "Queen", "King" },
			display_ranks = { "King", "Queen", "Jack" },
			atlas = chrono_hc.key,
			pos_style = "collab",
			colour = HEX("ff0000"),
		},
	},
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
