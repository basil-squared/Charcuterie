function CHAR.FUNC.cool_destroy(cards, seperate_sound)
    local cardstable = {}
---@diagnostic disable-next-line: undefined-field
    if Object.is(cards, Card) then
        cardstable[#cardstable + 1] = cards
    else
        cardstable = cards
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        blocking = false,
        func = function()
            for k, card in ipairs(cardstable) do
                card:flip()
                play_sound('generic1', 1, 0.65)
                card:juice_up(1.2, 25)
            end
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.8,
        blocking = false,
        func = function()
            play_sound(seperate_sound or 'glass1', 1.0, 0.65)
            SMODS.destroy_cards(cardstable)
            return true
        end
    }))
end