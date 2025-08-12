SMODS.Joker {
    key = "buckshot",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 53,y=0},
    rarity = 3,
    cost = 7,
    config = {extra = {odds = 5, repetitions = 2}},
    loc_vars = function(self,info_queue,card)
        return {vars = {(G.GAME.probabilities.normal or 1),card.ability.extra.odds}}
    end,
    calculate = function(self,card,context)
        if pseudorandom('caoiehnf') < G.GAME.probabilities.normal / card.ability.extra.odds then
            
                if context.repetition and context.cardarea == G.play then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
                
            
        end
            
        end
        
    
}