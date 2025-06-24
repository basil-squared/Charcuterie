SMODS.Joker {
    key = 'prank',
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 51,y=0},
    rarity = 2,
    config = {extra = {xmult = 1.2}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_arc
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual  and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_charcuterie_arc") then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}