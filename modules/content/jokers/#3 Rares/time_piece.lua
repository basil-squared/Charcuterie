SMODS.Joker {
    key = 'time_piece',
    atlas = CHAR.G.jokeratlas2.key,
    pos = { x = 0, y = 0 },
    config = { extra = { obtained_ante = 1, curr_ante = 1 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.obtained_ante,  card.ability.extra.curr_ante}}
    end,
    rarity = 3,
    price = 10,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.obtained_ante = G.GAME.round_resets.ante
        card.ability.extra.curr_ante = G.GAME.round_resets.ante
    end,
    calculate = function(self, card, context)
        if context.ante_change then
            card.ability.extra.curr_ante = G.GAME.round_resets.ante
        end
        if context.joker_type_destroyed or context.selling_card then
            if context.card == card then
                ease_ante(-(card.ability.extra.current_ante - card.ability.extra.obtained_ante))
            end
        end
    end
    
}