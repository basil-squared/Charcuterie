function CHAR.FUNC.overclock_proc(card,key)
	card:flip()
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 1,
		blocking = false,
		blockable = true,
		func = function()
			card:juice_up(0.5,0.1)
			SMODS.calculate_effect({message = "Overclocked!",colour = G.C.BLUE},card)
			return true
		end
	}))
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 2,
		blocking = false,
		blockable = true,
		func = function()
			card:set_ability(key)
			card:flip()
			return true
		end

	}))
	CHAR.G.Overclock_Table[key] = true
end