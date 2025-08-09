SMODS.Joker {
    key = "cursed_die",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 40, y= 0},
    rarity = 2,
    cost = 5,
   
    calculate = function(self,card,context)
        if context.mod_probability and not context.blueprint then
            CHAR.G.RISK_LOCK = true
            CHAR.FUNC.ease_risk(100)
            return {
                numerator = context.numerator * 4
            }

        end

    end,
    remove_from_deck = function(self,from_debuff)
        if CHAR.G.RISK_LOCK then
            CHAR.G.RISK_LOCK = false
            CHAR.FUNC.ease_risk(-50)
        end
    end
    
}