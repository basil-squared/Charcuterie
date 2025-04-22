blindatlas = SMODS.Atlas({
	px = 34,
	py = 34,
	key = "blindatlas",
	path = "blindatlas.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 21,
})

SMODS.Blind({
	key = "the_seer",
	loc_txt = {
		name = "The Seer",
		text = { "Applies the Curse enhancement to every card played." },
	},
	atlas = blindatlas.key,
	pos = { x = 0, y = 1 },
	discovered = true,
	boss_colour = HEX("400707"),
	boss = { min = 2, max = 10 },

	calculate = function(self, blind, context)
		if context.individual and (context.cardarea == G.play or context.cardarea == "unscored") then
			context.other_card:juice_up(0.3, 1)
			context.other_card:set_ability("m_astropulvis_cursed")
		end
	end,
})

SMODS.Blind({
	key = "the_ocean",
	loc_txt = {
		name = "The Ocean",
		text = { "Strips away attributes from played cards." },
	},
	atlas = blindatlas.key,
	pos = { x = 0, y = 0 },

	boss_colour = HEX("3e59ab"),
	boss = { min = 4, max = 10 },
	calculate = function(self, blind, context)
		if context.individual and (context.cardarea == G.play or context.cardarea == "unscored") then
			context.other_card:juice_up(0.3, 1)
			context.other_card:set_ability("c_base")
			context.other_card:set_edition(nil)
		end
	end,
})

SMODS.Blind({
	key = "the_parasite",
	loc_txt = {
		name = "The Parasite",
		text = { "0.75x mult and chips after calculation." },
	},
	atlas = blindatlas.key,
	pos = { x = 0, y = 2 },
	boss_colour = HEX("883131"),
	boss = { min = 2, max = 20 },
	calculate = function(self, blind, context)
		if context.final_scoring_step then
			print("Code reached, bitch!")
			return {
				remove_default_message = true,
				chips = -(hand_chips * 0.25),
				mult = -(mult * 0.25),
			}
		end
	end,
})

SMODS.Blind({
	key = "the_dip",
	loc_txt = {
		name = "The Dip",
		text = { "Cards have no suits." },
	},
	atlas = blindatlas.key,
	pos = { x = 0, y = 3 },
	boss_colour = HEX("30b024"),
	boss = { min = 3, max = 200 },
	set_blind = function(self) end,
})

SMODS.Blind({
	key = "the_commander",
	loc_txt = {
		name = "The Commander",
		text = { "Disable a random suit. Changes every hand." },
	},
	atlas = blindatlas.key,
	pos = { x = 0, y = 4 },
	boss_colour = HEX("f17c00"),
	boss = { min = 1, max = 100 },
})
