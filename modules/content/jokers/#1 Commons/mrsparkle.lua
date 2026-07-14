SMODS.Joker {
    key = 'mrsparkle',
    rarity = 1,
    cost = 4,
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=6,y=1},
    config = {extra = {dollars = 2}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_charcuterie_recycled"]
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
    calculate = function(self, card, context)
    if context.cardarea == G.play then
        local total_dollars = 0
        for k, v in ipairs(context.full_hand) do
            if SMODS.has_enhancement(v, "m_charcuterie_recycled") then
                v:set_ability(G.P_CENTERS.c_base, nil, true)
                v:juice_up(1.2, 25)
                total_dollars = total_dollars + card.ability.extra.dollars
            end
        end
        if total_dollars > 0 then
            return {
                dollars = total_dollars,
                card = card
            }
        end
    end
end,
}