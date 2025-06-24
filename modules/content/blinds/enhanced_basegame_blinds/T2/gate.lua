SMODS.Blind {
	key = "bigwindow",
	atlas = CHAR.G.blindatlas.key,

	boss_colour = HEX("fda200"),
	boss = {min = 80000000000, max = 16},
	pos = {x=0,y=26},
	mult = 3,
	calculate = function(self,blind,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.suit == "Diamonds" then
				SMODS.debuff_card(context.other_card,false,"SUPER_EVIL_DEBUFF_OF_HORRIBLE_DEATH_ALSO_FUCK_YOU_N")
			end
		end
	end
}

