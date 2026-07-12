SMODS.Joker {
    key = 'onebit',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=4,y=0},
    rarity = 1,
    cost = 4,
    config = {extra = {mult = 4, chips = 30}},
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if G.GAME and CHAR.FUNC.is_even(G.GAME.hands_played) then
                return {
                    mult = card.ability.extra.mult
                }
            else 
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end 

}