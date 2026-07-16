SMODS.Joker {
    key = 'redacted',
    rarity = 2,
    cost = 5,
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=5,y=1},
    config = {extra = {max_suitless = 1}},
    loc_vars = function(self,info_queue,card)
        local text = ""
        if card.ability.extra.max_suitless ~= 1 then text = "gaps" else text = "gap" end
        return {
            vars = {
                card.ability.extra.max_suitless,
                text
            }
        }
    end
}

-- similarly to censor, func is in get_flush :)