SMODS.Consumable {
    set = "ritual",
    key = "ritual_frame",
    loc_txt = {
        name = "Frame",
        text = {"{C:attention}Pin{} a random Joker.","Reduce {C:red}Risk{} by {C:green}20%{}"}
    },
    atlas = ASPL.G.ritualatlas.key,
    pos = {x=6,y=0},
    use = function(self,area,card,copier)
        local random_joker = pseudorandom_element(G.jokers.cards, pseudoseed("Happy wheels"))
        random_joker.pinned = true
        random_joker:juice_up()
        ASPL.FUNC.ease_risk(-20)
    end,
    can_use = function(self,area)
        if #G.jokers.cards > 0 then
            return true
        else
            return false
        end
    end


}