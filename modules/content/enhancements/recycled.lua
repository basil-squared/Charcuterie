SMODS.Enhancement {
    key = 'recycled',
    atlas = CHAR.G.enhancementatlas.key,
    pos = {x=5,y=0},
    config = {extra = {dollar_bonus = 2, paid_this_round = false}},
    loc_vars = function(self,info_queue,card) 
        return {vars = {card.ability.extra.dollar_bonus}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            card.ability.extra.paid_this_round = false
        end
        if context.end_of_round and context.cardarea == G.hand and not card.ability.extra.paid_this_round then
            local backup = G.GAME.interest_amount
            G.GAME.interest_amount = 0
            card.ability.extra.paid_this_round = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 10,
                blocking = false,
                func = function()
                    -- if theres multiple recycled cards i dont want to accidentally overwrite a non zero value with a zero one
                    if backup > G.GAME.interest_amount then
                        G.GAME.interest_amount = backup
                    end
                    
                    return true
                end
            }))
            return {
                dollars = card.ability.extra.dollar_bonus,
                card = card,
                

            }
            
        end
        if context.setting_blind and G.GAME.charcuterie_interest_backup then
            G.GAME.interest_amount = G.GAME.charcuterie_interest_backup
            G.GAME.charcuterie_interest_backup = nil
        end
    end
}