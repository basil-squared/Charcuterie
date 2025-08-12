SMODS.Blind {
	key = "biggerarm",
	atlas = CHAR.G.blindatlas.key,
	boss_colour = HEX("7278ca"),
	boss = {min = 16, max = 999},
	pos = {x=0,y=13},
	mult=5,
	calculate = function(self,blind,context)
		if context.before  then
			
			return {level_up = -G.GAME.hands[context.scoring_name].level + 1}
		end
	end
}
