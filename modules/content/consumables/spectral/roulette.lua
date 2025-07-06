SMODS.Consumable {
    set = "Spectral",
    key = "roulette",
    atlas = CHAR.G.tarotatlas.key,
    pos = {x = 5, y=0 },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
    use = function(self, card, area, copier)
        local uneditioned_jokers = {}
        local editioned_jokers   = {}
    
        for _, joker in ipairs(G.jokers.cards) do
            if joker.edition then
                table.insert(editioned_jokers, joker)
            else
                table.insert(uneditioned_jokers, joker)
            end
        end
    
        local r_e_joker = (#editioned_jokers > 0) and pseudorandom_element(editioned_jokers, pseudoseed("edition joker")) or nil
        local r_u_joker = (#uneditioned_jokers > 0) and pseudorandom_element(uneditioned_jokers, pseudoseed("unedition joker")) or nil
    
        if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false then
            if r_e_joker and r_e_joker.edition then
                r_e_joker:set_edition(nil)
            end
        else
            if r_u_joker and not r_u_joker.edition then
                local sel_edition = poll_edition('blahblahblah',nil,false,true)
                r_u_joker:set_edition(sel_edition)
                r_u_joker:juice_up()
            end
        end
    end,
    
    can_use = function(self,area)
        if #G.jokers.cards > 0 then
            return true
        else
            return false
        end
    end
}