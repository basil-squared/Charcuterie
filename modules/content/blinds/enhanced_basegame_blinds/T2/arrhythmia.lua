SMODS.Blind {
	key = "bighead",
	atlas = CHAR.G.blindatlas.key,

	boss_colour = HEX("ec2d33"),
	boss = {min = 80000000000, max = 16},
	pos = {x=0,y=24},
	mult = 3,
	calculate = function(self,blind,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.suit == "Hearts" then
				SMODS.debuff_card(context.other_card,true,"SUPER_EVIL_DEBUFF_OF_HORRIBLE_DEATH_ALSO_FUCK_YOU_N")
			end
		end
	end
}