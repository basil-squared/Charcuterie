SMODS.Joker {
    key = 'censor',
    rarity = 2,
    cost = 5,
    pos = {x=4,y=1},
    config = {extra = {gap_size = 1}},
    atlas = CHAR.G.jokeratlas2.key,
    loc_vars = function(self,info_queue,card)
        local text = ""
        if card.ability.gap_size ~= 1 then text = 'gaps' else text= 'gap' end
        return {vars = {card.ability.extra.gap_size, text}}
    end
}

-- functionality is covered in utils/get_straight.lua :)