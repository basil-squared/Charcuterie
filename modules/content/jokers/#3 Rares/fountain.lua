SMODS.Joker {
    key = 'fountain',
    rarity = 3,
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x = 8,y=1},
    config = {extra = {hands_remaining = 5}},
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.hands_remaining
            }
        }
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if card.ability.extra.hands_remaining <= 1 then
                SMODS.destroy_cards(card)
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                blocking = false,
                blockable = true,
                func = function()
                    context.other_card:juice_up(0.5,0.2)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                blocking = false,
                blockable = true,
                func = function()
                    context.other_card:set_ability('m_charcuterie_void')
                    return true
                end
            }))
        end
        if context.post_joker then
            card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
            return {
                message = card.ability.extra.hands_remaining .. " Remaining"
            }
        end


    end
}