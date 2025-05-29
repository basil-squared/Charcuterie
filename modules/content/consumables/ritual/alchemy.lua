SMODS.Consumable {
    key = "alchemy",
    set = 'ritual',
    atlas = CHAR.G.ritualatlas.key,
    pos = {x =9,y=0},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
    can_use = function(self, card)
        if G.STATE == G.STATES.SELECTING_HAND or G.STATES.SMODS_BOOSTER_OPENED then
            return true
        else
            return false
        end
    end,
    use = function(self,area,card,copier)
        if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false then
            local dissolve_targets = G.hand.cards
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                blockable = false,
                func = function()
                    for i=1,#dissolve_targets do
                        if dissolve_targets[i] and dissolve_targets[i].start_dissolve then

                            dissolve_targets[i]:start_dissolve()
                        end
                    end


                    return true
                end,
            }))
        else
            for i=1,#G.hand.cards do
                G.hand.cards[i]:set_ability("m_gold")
                G.hand.cards[i]:juice_up(0.1,0.1)
            end
        end
    end
}