SMODS.Joker {
    key = 'elesh_norn',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x = 8,y=1},
    config = {extra = {money_gained = 2}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_rot
        return {
            vars = {
                card.ability.extra.money_gained
            }
        }
    end

    -- functionality is handled by rot cards
}