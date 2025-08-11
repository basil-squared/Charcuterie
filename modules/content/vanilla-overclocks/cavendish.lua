SMODS.Joker:take_ownership('j_cavendish',
{
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr =  {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_blue_java'
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'cavendish', 1, card.ability.extra.odds) then
                CHAR.FUNC.overclock_proc({card=card,key=card.ability.ext_ovr.overclock_counterpart,})
            end
        end
    end

},true)