SMODS.Joker {
    key = 'overcurrent',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=2,y=2},
    config = { extra = { num = 1, denom = 4}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_charcuterie_arc
        local newnum,newdenom = SMODS.get_probability_vars(card,card.ability.extra.num,card.ability.extra.denom,"MrOuch")
        return {
            newnum,
            newdenom
        }
    end,
    calculate = function(self,card,context)
        if context.charcuterie_arc_retrigger then
            if SMODS.pseudorandom_probability(card,"Electricityy",card.ability.extra.num,card.ability.extra.denom,"MrOuch") then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4, 
                    func = function()
                        context.other_card:flip()

                    end

                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6, 
                    func = function()
                        context.other_card:juice_up(1.2,25)
                        context.other_card:set_ability("m_charcuterie_arc")
                    end

                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.8, 
                    func = function()
                        context.other_card:flip()

                    end

                }))
                return {
                    message = 'Zap!'
                }
            end
        end
    end
}