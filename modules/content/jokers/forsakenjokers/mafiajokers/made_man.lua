SMODS.Joker {
	key = "made_man",
	rarity = "charcuterie_hidden",
	config = {extra = {mafia = true}},
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=49,y=0},
	pools = { ["mafia"] = true},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other", key = "char_txt_mafia"}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and not context.game_over and context.main_eval and G.GAME.blind.boss and G and G.GAME and to_big(G.GAME.dollars) > to_big(0) then
			add_tag(Tag('tag_investment'))
		end
	end

	}


