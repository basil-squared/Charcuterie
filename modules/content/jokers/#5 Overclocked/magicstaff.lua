SMODS.Joker {
	key = "magic_wand",
	cost = 30,
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=6,y=0},
	rarity = "charcuterie_overclocked",

	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other",key="char_txt_oc"}

	end,
	unlocked = false,
	locked_loc_vars = function(self,info_queue,card)

	end,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_magic_wand'] then
			return true

		end
		return false

	end
}