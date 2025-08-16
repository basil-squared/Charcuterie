SMODS.Joker {
    key = "buckshot",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 53,y=0},
    rarity = 3,
    cost = 7,
    config = {extra = {odds = 5, repetitions = 2}},
    loc_vars = function(self, info_queue, card)
        local num,denom = SMODS.get_probability_vars(card,1,card.abiility.extra.odds)
        return {vars = {num,denom}}
    end,
    calculate = function(self,card,context)
        if SMODS.pseudorandom_probability(card,'wepofwjkpfjkpifj',1,card.ability.extra.odds) then
            
                if context.repetition and context.cardarea == G.play then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
                
            
        end
            
        end
        
    
}