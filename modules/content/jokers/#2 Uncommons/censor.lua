SMODS.Joker {
    key = 'censor',
    pos = {x=4,y=1},
    config = {extra = {gap_size = 1}},
    atlas = CHAR.G.jokeratlas2.key,
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.gap_size}}
    end
}

-- functionality is covered in utils/get_straight.lua :)