SMODS.Joker:take_ownership('j_burglar',{

    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_bank_robbery'
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('burglar')
    end,
    calculate = function(self,card,context)
        if to_big(G.game.dollars) >= 500 then
            CHAR.FUNC.overclock_proc({card=card,key='j_charcuterie_bank_robbery'})
        end
    end


},true)