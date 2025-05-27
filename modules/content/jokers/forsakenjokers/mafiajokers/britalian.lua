SMODS.Joker {
	key = "britalian",
	rarity = "charcuterie_hidden",
	config = {extra = {money_awarded = 1,mafia = true}},
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 48, y=0},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = {set = "Other", key = "char_txt_mafia"}
		return {vars = {card.ability.extra.money_awarded}}
	end,
	pools = { ["mafia"] = true},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			for i=1,#context.full_hand do
				if SMODS.has_enhancement(context.full_hand[i], 'Stone') then
					ease_dollars(1)
				end
			end
		end
	end
}