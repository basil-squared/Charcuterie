SMODS.Joker {
    key = 'blue_java',
    atlas = CHAR.G.overclockedatlas.key,
    pos = {x = 1,y = 0},
    rarity = 'charcuterie_overclocked',
    config = {extra = {odds = 10000, xmult = 12}},
    loc_vars = function(self,info_queue,card)
        local new_num, new_denom = SMODS.get_probability_vars(card,1, card.ability.extra.odds,'blue_java') -- Utilizes new probablility system
        return {vars = {card.ability.extra.xmult,new_num,new_denom}}
    end,
    unlocked = false,
    check_for_unlock = function(args)
        return G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_blue_java']
        
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card,'gi4jjiw',1,card.ability.extra.odds,'blue_java_die') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3,0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end

    end
}