SMODS.Blind({
	key = "parasite",

	atlas = CHAR.G.blindatlas.key,
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
