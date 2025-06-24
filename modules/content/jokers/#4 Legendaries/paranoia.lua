SMODS.Joker {
    key = 'paranoia',
    atlas = CHAR.G.jokeratlas.key,
    pos = {x =54,y=0},
    soul_pos = {x= 55, y=0},
    cost = 10,
    rarity = 4 ,
    config = {extra= {chance = 2}},
    loc_vars = function(self,info_queue,card)
        return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.chance}}
    end,
    calculate = function(self, card, context)
        if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if pseudorandom('nah nah nah nah nah' .. G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.chance then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        SMODS.add_card {
                            set = 'Spectral',
                            key_append = 'charcuterie_paranoia', -- Optional, useful for checking the source of the creation in `in_pool`.
                            edition = "e_negative"
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.PURPLE,
                }
            end
        end
    end
}