SMODS.Joker:take_ownership('j_trio',{
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('trio')
    end,
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart  = 'j_charcuterie_pour_deux'
    end,
    calculate = function(self,card,context)
        if context.end_of_round and not context.game_over and to_big(G.GAME.hands['Three of a Kind'].played) >= to_big(30) then
            CHAR.FUNC.overclock_proc({card=card,key=card.ability.ext_ovr.overclock_counterpart})
        end
    end
    
},true)