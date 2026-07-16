local get_flush_ref = get_flush

function get_flush(hand)
    local redacted_cards = SMODS.find_card('j_charcuterie_redacted')
    if next(redacted_cards) then
        local redacted = redacted_cards[1]
        local max_suitless = redacted.ability.extra.max_suitless

        local suitless_cards = {}
        for _, card in ipairs(hand) do
            if SMODS.has_no_suit(card) then
                suitless_cards[#suitless_cards+1] = card
            end
        end
        local limit = math.min(#suitless_cards, max_suitless)
        local overrides = {}
        for i = 1, limit do
            local c = suitless_cards[i]
            overrides[#overrides+1] = {card = c, original = c.is_suit}
            -- this one can be 'dumber' than the straight function so it gets to be less expensive computationally too :)
            c.is_suit = function(self,suit,...) return true end
        end
        local result = get_flush_ref(hand)
        for _, o in ipairs(overrides) do
            o.card.is_suit = o.original
        end
        return result
    end
    return get_flush_ref(hand)
end