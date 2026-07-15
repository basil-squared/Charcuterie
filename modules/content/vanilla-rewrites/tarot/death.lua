SMODS.Consumable:take_ownership('c_death', {
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.max_highlighted}}
    end,
    config = { extra = {min_highlighted = 2,max_highlighted = 2}},
    can_use = function(self,card)
        return #G.consumeables.highlighted >= card.ability.extra.min_highlighted and #G.consumeables.highlighted <= card.ability.extra.max_highlighted
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3,0.5)
                return true
            end
        }))
        for i=1, #G.hand.highlighted do
            local snd_percent = 1.15 - (i -.999) / (#G.hand.highlighted - .998) * .3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1',percent)
                    G.hand.highlighted[i]:juice_up(0.3,0.3)
                    return true
                end
            }))

        end
        delay (0.2)
        local rightmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then
                rightmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        SMODS.copy_card(rightmost, { new_card = G.hand.highlighted[i] })
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2',percent,0.6)
                    G.hand.highlighted[i]:juice_up(0.3,0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)


    end
})