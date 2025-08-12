SMODS.Joker {
    key = "cursed_die",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 40, y= 0},
    rarity = 2,
    cost = 5,
   
    calculate = function(self,card,context)
        if G.GAME.Risk ~= 100 then
            CHAR.FUNC.ease_risk(1000, true)
        end
        if context.mod_probability and not context.blueprint then
            
            
            return {
                numerator = context.numerator * 4
            }

        end

    end,
    
    
}