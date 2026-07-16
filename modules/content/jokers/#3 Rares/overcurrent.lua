SMODS.Joker {
    key = 'overcurrent',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=2,y=2},
    rarity = 3,
    cost = 8,
    config = { extra = { num = 1, denom = 3}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_arc
        local newnum,newdenom = SMODS.get_probability_vars(card,card.ability.extra.num,card.ability.extra.denom,"MrOuch")
        return {
            vars = {
                newnum,
                newdenom
            }
            
        }
    end,
    calculate = function(self,card,context)
        if context.charcuterie_arc_retrigger then
            if SMODS.pseudorandom_probability(card,"Electricityy",card.ability.extra.num,card.ability.extra.denom,"MrOuch") then
                local target_card = context.other_card or {}
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4, 
                    func = function()
                       target_card:flip()
                        return true
                    end

                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6, 
                    func = function()
                        target_card:juice_up(1.1,5)
                        play_sound('generic1',1,0.65)
                        target_card:set_ability("m_charcuterie_arc")
                        return true
                    end

                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.8, 
                    func = function()
                        target_card:flip()
                        return true

                    end

                }))
                return {
                    message = 'Zap!'
                }
            end
        end
    end
}