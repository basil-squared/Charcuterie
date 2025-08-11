SMODS.Joker:take_ownership('j_supernova',{
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_hypernova'
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('supernova')
    end,
    calculate = function(self,card,context)
        if context.using_consumeable and context.consumeable.config.center.key == 'c_black_hole' then
            CHAR.FUNC.overclock_proc({key = 'j_charcuterie_hypernova',card=card})
        end
    end


},true)