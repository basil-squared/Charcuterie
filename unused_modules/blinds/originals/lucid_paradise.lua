SMODS.Blind({
	key = "lucid_paradise",

	atlas = CHAR.G.blindatlas.key,
	pos = { x = 0, y = 28 },
	boss_colour = HEX("30b024"),
	boss = { min = 999999, max = 200 },
	set_blind = function(self) 
		open_lyr_UI()
        CHAR.FUNC.rewrite_lyr()
	end,
})