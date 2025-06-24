

local bm = SMODS.Blind {
	key = "biggermanacle",

	boss = {min = 16, max =16},
	boss_colour = HEX("ffff96"),
	atlas = CHAR.G.blindatlas.key,
	pos = {x=0,y=17},
	mult=5

}

bm.set_blind = function(self)

	G.hand:change_size(-5)
end
sg.disable = function(self)
	print("Cannot be disabled!")
end

sg.defeat = function(self)
	G.hand:change_size(5)
end