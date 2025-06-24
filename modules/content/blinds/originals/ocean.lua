SMODS.Blind({
	key = "ocean",

	atlas = CHAR.G.blindatlas.key,
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