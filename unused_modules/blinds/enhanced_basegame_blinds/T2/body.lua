SMODS.Blind {
	key = "bigarm",
	atlas = CHAR.G.blindatlas.key,

	boss_colour = HEX("7278ca"),
	boss = {min = 80000000000, max = 16},
	pos = {x=0,y=12},
	mult = 3,
	calculate = function(self,blind,context)
		if context.before and context.cardarea == G.play then
			return {level_up = -2}
		end
	end
}