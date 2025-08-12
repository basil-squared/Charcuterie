SMODS.Joker:take_ownership('j_madness',{
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_delirium'
        card.ability.ext_ovr.req_xmult = 7
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('madness')
    end,
    -- Most of this stuff is in a lovely patch!



},true)