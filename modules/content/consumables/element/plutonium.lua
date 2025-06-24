SMODS.Consumable {
	set = "Element",
	key = "plutonium",
	loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
	atlas = CHAR.G.elementatlas.key,
	pos = {x=2,y=0}
}