SMODS.Joker {
	key = "snake_eyes",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 62, y= 0},
	rarity = 1,
	cost = 5,
	add_to_deck = function(self, card, from_debuff)
		
		G.GAME.RISK_RATE = 0.5
	end,
	remove_from_deck = function(self, card, from_debuff)
		
		G.GAME.RISK_RATE = 1

    end,
    calculate = function(self, card, context) -- Fixed to use new probability mod system ^w^
		if context.mod_probability then
            return {
				numerator = context.numerator * 0.5
			}
		end
	end


}