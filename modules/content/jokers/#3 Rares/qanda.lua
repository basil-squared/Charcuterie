SMODS.Joker {
    key = 'qanda',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=0,y=2},
    rarity = 3,
    cost = 8,
    config = {extra = {reset_odds = 6, num = 1, base_xmult = 1, xmult_increm = 0.5, current_xmult = 1}},
    loc_vars = function(self,info_queue,card)
        local newnum,newdenom = SMODS.get_probability_vars(card,card.ability.extra.num,card.ability.extra.reset_odds,"Q.E.D")
        return {
            vars = {
                card.ability.extra.xmult_increm,
                newnum,
                newdenom,
                card.ability.extra.current_xmult
            }
        }
    end,
    calculate = function(self,card,context)
        if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'ritual' then
            if SMODS.pseudorandom_probability(card,"Seeking&Shadow",card.ability.extra.num,card.ability.extra.reset_odds,"Q.E.D") then
                card.ability.extra.current_xmult = card.ability.extra.base_xmult
                return {
                    message = localize('k_reset')
                }
                
            end
            card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.xmult_increm
            return {
                message = localize('k_upgrade_ex')
            }
            
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.current_xmult
            }
        end
    end
}