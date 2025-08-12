SMODS.Joker {
	key = "debt_collector",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=12,y=0},
	pools = { ["mafia"] = true},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = "Other", key = "char_txt_mafia"}
		
            local sell_cost = 0
			if G and G.jokers and G.jokers.cards then
				for _, joker in ipairs(G.jokers.cards) do
                
                sell_cost = sell_cost + to_big(joker.sell_cost)
                
            	end
			end
			sell_cost = sell_cost /2
			sell_cost = round_number(sell_cost,0)
			return {vars = {sell_cost}}
            
	end,

	calc_dollar_bonus = function(self,card)
		
            local sell_cost = 0
            for _, joker in ipairs(G.jokers.cards) do
                
                sell_cost = sell_cost + to_big(joker.sell_cost)

            end
			sell_cost = sell_cost /2
			if to_big(G.GAME.dollars) > to_big(0) then
				return round_number(sell_cost,0)
			end
			
		end
	
}