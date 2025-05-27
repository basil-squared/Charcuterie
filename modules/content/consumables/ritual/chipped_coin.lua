SMODS.Consumable({
	key = "chippedcoin",
	set = "ritual",

	atlas = CHAR.G.ritualatlas.key,
	pos = { x = 6, y = 0 },
	loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,

	use = function(self,card,area,copier)
		if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
			ease_dollars(-to_big(G.GAME.dollars))
			-- #TODO: put the logic here
		else
			ease_dollars(to_big((G.GAME.dollars or 0)))
		end
	end,
	can_use = function(self,card)
		return true
	end

})