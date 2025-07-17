SMODS.Consumable {
	key = 'reroll',
	set = 'ritual',
	atlas = CHAR.G.ritualatlas.key,
	pos = {x = 2, y = 4},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
		return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
	end,
	use = function(self,card,area,copier)
		if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
		-- TODO: IMPLEMENT

		else

		end
	end
}