SMODS.Joker {
    key = 'useless_collectable',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x =3,y=1},
    cost = 15,
    config = { extra = {dollar_bonus = 10}},
    add_to_deck  = function(self,card,from_debuff)
        card:set_eternal(true)
    end,
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.dollar_bonus}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.dollar_bonus
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end

}