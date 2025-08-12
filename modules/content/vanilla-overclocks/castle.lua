--[[ 
psst ... the overclock requirements for this one are stored in a lovely patch! please go there if you have any vague sort of intent on messing with it.
]]
SMODS.Joker:take_ownership('j_castle',{
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = CHAR.FUNC.ochint_mgr('castle')
    end,
    add_to_deck = function(self,card,from_debuff)
        card.ability.ext_ovr = {}
        card.ability.ext_ovr.overclock_counterpart = 'j_charcuterie_bunker'
    end
},true)