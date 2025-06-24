SMODS.Consumable {
    key = "alchemy",
    set = 'ritual',
    atlas = CHAR.G.ritualatlas.key,
    pos = {x =6,y=0},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
}