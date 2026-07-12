SMODS.Joker {
    key = 'cultist',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=5,y=0},
    config = {extra = {dollar_granted = 2}},
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.dollar_granted
            }
        }
    end,
    rarity = 1,
    cost = 4,
    calculate = function(self,card,context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'ritual' then
                return {
                    dollars = card.ability.extra.dollar_granted
                }
            end
        end
    end
}