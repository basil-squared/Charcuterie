local main_menu_ref = Game.main_menu

---@diagnostic disable-next-line: duplicate-set-field
Game.main_menu = function(change_context)
    
    local ret = main_menu_ref(change_context)
    local sel_card = 'c_charcuterie_boost_circuit'
    local newcard = Card(
        G.title_top.T.x,
        G.title_top.T.y,
        G.CARD_W*1.1*1.2,
        G.CARD_H*1.1*1.2,
        G.P_CARDS.empty,
        G.P_CENTERS[sel_card],
        {bypass_discovery_center = true}
    )
---@diagnostic disable-next-line: undefined-global
    if not Cryptid then
        G.title_top.T.w = G.title_top.T.w * 1.7675
        G.title_top.T.X = G.title_top.T.x - 0.8
    end
    G.title_top:emplace(newcard)
    newcard.no_ui =  true
    newcard.states.visible = true
    newcard.sticker_run = "NONE"
    return ret
end