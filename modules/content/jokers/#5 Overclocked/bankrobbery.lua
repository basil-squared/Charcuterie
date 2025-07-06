SMODS.Joker {
    key = 'bank_robbery',
    atlas = CHAR.G.overclockedatlas.key,
    pos = {x = 23, y=0},
    config = { extra = {hands = 6}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other',key = 'char_txt_oc'}
        return {vars = {card.ability.extra.hands}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_discard(-G.GAME.current_round.discards_left, nil, true)
                    ease_hands_played(card.ability.extra.hands)
                    SMODS.calculate_effect(
                        { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                        context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    
    end,
    rarity = 'charcuterie_overclocked',
    cost = 30

}