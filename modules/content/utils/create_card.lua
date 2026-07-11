local smods_create_card_ref = SMODS.create_card
function SMODS.create_card(t)
    print("SMODS CREATE CARD KEY:", t.key, "SET:", t.set)
    if t.key and CHAR.G.OVERCLOCK_MAP[t.key]
        and G.GAME.selected_back and G.GAME.selected_back.name == "b_charcuterie_turbo" then
        t.key = CHAR.G.OVERCLOCK_MAP[t.key]
    end
    return smods_create_card_ref(t)
end
-- MAYBE ITLL FINALLY WORK
-- fuck everything dawg