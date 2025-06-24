SMODS.Joker {
	key = "bunny",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=50,y=0},
	pools = { ["mafia"] = true},
	config = {extra = {chance = 3, produce = 2}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other", key = "char_txt_mafia"}
		return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.chance, card.ability.extra.produce}}
	end,
	calculate = function(self,card,context)
		if context.selling_self and G and G.GAME and G.GAME.dollars > 0 then
			if pseudorandom('fuck') < G.GAME.probabilities.normal / card.ability.extra.chance then
				for i=1, card.ability.extra.produce do
					SMODS.add_card({key = "j_charcuterie_bunny",edition = "e_negative"})
				end
				
			end
		end
	end
}
