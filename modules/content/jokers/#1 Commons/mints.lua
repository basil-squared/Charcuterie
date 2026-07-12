SMODS.Joker {
    key = 'mints',
    atlas = CHAR.G.jokeratlas2.key,
    pos = { x = 8,y=0},
    config = {extra = {curr_xchips = 2, xchip_decrem = 0.5, xchip_min = 1}},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.curr_xchips, card.ability.extra.xchip_decrem}}
    end,
    rarity = 1,
    cost = 4,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.curr_xchips
            }
        end
        if context.post_joker then
            if (mult > hand_chips ) then
                card.ability.extra.curr_xchips = card.ability.extra.curr_xchips - card.ability.extra.xchip_decrem
                
                if (card.ability.extra.curr_xchips <= card.ability.extra.xchip_min) then
                    SMODS.destroy_cards(card)
                    return {
                        message = localize("k_eaten_ex")
                    }
                else
                    return {
                        message = "-X" .. card.ability.extra.xchip_decrem,
                        colour = G.C.UI_CHIPS
                    }
                end
            end
        end
    end
}
-- TODO: this acts a little weird sometimes