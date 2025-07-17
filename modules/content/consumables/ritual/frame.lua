SMODS.Consumable {
    set = "ritual",
    key = "frame",
    loc_txt = {
        name = "Frame",
        text = {"{C:attention}Pin{} a random Joker, and make it {C:pink}Eternal{}.","Reduce {C:red}Risk{} by {C:green}20%{}"}
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
    atlas = CHAR.G.ritualatlas.key,
    pos = {x=0,y=1},
    use = function(self,area,card,copier)
        local random_joker = assert(pseudorandom_element(G.jokers.cards, pseudoseed("Happy wheels")))
        random_joker.pinned = true
        random_joker:set_eternal(true)
        random_joker:juice_up()
        CHAR.FUNC.ease_risk(-20)

    end,
    can_use = function(self,area)
        if #G.jokers.cards > 0 then
            return true
        else
            return false
        end
    end


}