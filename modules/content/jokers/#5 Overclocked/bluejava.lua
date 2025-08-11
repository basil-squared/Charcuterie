SMODS.Joker {
    key = 'blue_java',
    atlas = CHAR.G.overclockedatlas.key,
    pos = {x = 1,y = 0},
    rarity = 'charcuterie_overclocked',
    config = {extra = {odds = 10000, xmult = 12}},
    loc_vars = function(self,info_queue,card)
        local new_num, new_denom = SMODS.get_probability_vars(card,1, card.ability.extra.odds,'blue_java') -- Utilizes new probablility system
        return {vars = {card.ability.extra.xmult,new_num,new_denom}}
    end,
}