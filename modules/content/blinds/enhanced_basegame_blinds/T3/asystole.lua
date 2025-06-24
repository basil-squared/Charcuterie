SMODS.Blind {
	key = "biggerhead",
	atlas = CHAR.G.blindatlas.key,

	boss_colour = HEX("ec2d33"),
	boss = {min = 80000000000, max = 16},
	pos = {x=0,y=25},
	mult = 5,
	calculate = function(self,blind,context)
		if context.individual and context.cardarea == G.play then
			local kill_flag = false
			for i=1, #context.full_hand do
				if context.full_hand[i].base.suit == "Hearts" then
					kill_flag = true
				end
			end
			if kill_flag == true then
				SMODS.debuff_card(context.other_card,true,"SUPER_EVIL_DEBUFF_OF_HORRIBLE_DEATH_ALSO_FUCK_YOU_N")
			end
			
		end
	end
}