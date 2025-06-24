SMODS.Voucher {
    key = "brimstone",
    loc_txt = {
        name = "Brimstone",
        text = {"Converts one random card","In your {C:attention}full deck{} into","a {C:cursed}Cursed Card every round."}
    },
    cost=10,
    atlas = ASPL.G.voucheratlas.key,
    pos = {x=0,y=0}
}

SMODS.Voucher {
    key = "divine",
    loc_txt = {
        name = "Divine Light",
        text = {"{C:astropulvis_purified}Purifies{} all played {C:astropulvis_cursed}Cursed Cards{}"}
    },
    cost=10,
    atlas = ASPL.G.voucheratlas.key,
    pos = {x=1,y=0},
    requires = {"v_astropulvis_brimstone"}
}
