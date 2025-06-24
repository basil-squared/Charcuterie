SMODS.Blind({
	key = "seer",

	atlas = CHAR.G.blindatlas.key,
	pos = { x = 0, y = 1 },
	discovered = true,
	boss_colour = HEX("400707"),
	boss = { min = 2, max = 10 },




	calculate = function(self, blind, context)
		if context.individual and (context.cardarea == G.play or context.cardarea == "unscored") then
			context.other_card:juice_up(0.3, 1)
			context.other_card:set_ability("m_charcuterie_cursed")
		end
	end,
})