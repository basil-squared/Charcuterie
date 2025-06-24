SMODS.Booster {
    key  = "jumbo_ritual_booster",
    atlas = CHAR.G.boosteratlas.key,
    pos = {x = 0, y = 0},
    weight = 0.5,
    cost = 6,
    loc_txt = {
        name = "Ritual Pack",
        text = {"Choose {C:attention}1{} of {C:attention}5{}","{C:red}Ritual Cards{} to be used immediately"}, 
        group_name = "Ritual Pack"
    },
    config = {extra = 5, choose = 1},
    draw_hand = true,
    create_card = function(self,card,i)
        new_card = SMODS.create_card({ set = "ritual" })
        return new_card
    end,
    particles = function(self)
        return 
    end

}

SMODS.Booster {
    key  = "mega_ritual_booster",
    cost = 8,
    weight = 0.5,
    atlas = CHAR.G.boosteratlas.key,
    pos = {x = 1, y = 0},
    loc_txt = {
        name = "Ritual Pack",
        text = {"Choose {C:attention}2{} of {C:attention}5{}","{C:red}Ritual Cards{} to be used immediately"}, 
        group_name = "Ritual Pack"
    },
    config = {extra = 5, choose = 2},
    draw_hand = true,
    create_card = function(self,card,i)
        new_card = SMODS.create_card({ set = "ritual" })
        return new_card
    end,
    particles = function(self)
        return 
    end

}
SMODS.Booster {
    key  = "ritual_booster_1",
    atlas = CHAR.G.boosteratlas.key,
    pos = {x = 2, y = 0},
    weight = 0.5,
    loc_txt = {
        name = "Ritual Pack",
        text = {"Choose {C:attention}1{} of {C:attention}3{}","{C:red}Ritual Cards{} to be used immediately"},
        group_name = "Ritual Pack"
    },
    config = {extra = 3, choose = 1},
    draw_hand = true,
    create_card = function(self,card,i)
        new_card = SMODS.create_card({ set = "ritual" })
        return new_card
    end,


}
SMODS.Booster {
    key  = "ritual_booster_2",
    atlas = CHAR.G.boosteratlas.key,
    pos = {x = 3, y = 0},
    weight = 0.5,
    loc_txt = {
        name = "Ritual Pack",
        text = {"Choose {C:attention}1{} of {C:attention}3{}","{C:red}Ritual Cards{} to be used immediately"},
        group_name = "Ritual Pack"
    },
    config = {extra = 3, choose = 1},
    draw_hand = true,
    create_card = function(self,card,i)
        new_card = SMODS.create_card({ set = "ritual" })
        return new_card
    end,


}