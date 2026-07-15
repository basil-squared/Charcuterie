SMODS.Joker {
    key = 'yararara',
    rarity = 2,
    cost = 6,
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=1,y=1},
    config = {extra = {xmult_increm = 0.5, base_xmult = 1, current_xmult = 1}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set="Enhanced",key = 'm_charcuterie_cursed', config = { extra = {ttk =3}}}
        return {
            vars = {
                card.ability.extra.xmult_increm,
                card.ability.extra.current_xmult
            }
        }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.current_xmult
            }
        end
        if context.individual and context.cardarea == G.play then
                if SMODS.has_enhancement(context.other_card,'m_charcuterie_cursed') and not SMODS.is_eternal(context.other_card) then
                    card.ability.extra.current_xmult = card.ability.extra.current_xmult + (card.ability.extra.xmult_increm)
                    CHAR.FUNC.cool_destroy(context.other_card,nil)
                    return {
                        message = localize('k_upgrade_ex')
                    }
                end
        end
    end
}