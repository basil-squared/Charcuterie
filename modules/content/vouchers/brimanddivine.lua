SMODS.Voucher {
    key = "brimstone",

    cost=10,
    atlas = CHAR.G.voucheratlas.key,
    pos = {x=0,y=0},
    calculate = function(self,card,context)
        if context.setting_blind then
           local card_sel =  G.playing_cards[math.random(1,#G.playing_cards)]
            card_sel:set_ability("m_charcuterie_cursed")
            return {
                message = "Cursed!",
                colour = G.C.RED
            }
        end
    end
}

SMODS.Voucher {
    key = "divine",

    cost=10,
    atlas = CHAR.G.voucheratlas.key,
    pos = {x=1,y=0},
    requires = {"v_charcuterie_brimstone"},
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card,"m_charcuterie_cursed") then
                context.other_card:set_ability("m_charcuterie_purified")
                context.other_card:juice_up(0.1,0.1)
            end
        end
    end
}
