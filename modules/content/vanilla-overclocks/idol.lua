SMODS.Joker:take_ownership('j_idol',{
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_providence'
        card.ability.ext_ovr.counter = 0
    end,
    -- counter functionality is in a lovely patch, please check there
    calculate = function(self,card,context)
        if context.end_of_round and not context.game_over and not context.blueprint then
            if card.ability.ext_ovr.counter >= 5 then
                CHAR.FUNC.overclock_proc({card=card,key='j_charcuterie_providence'})
            end
        end
    end
},true)