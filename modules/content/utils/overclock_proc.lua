function CHAR.FUNC.overclock_proc(arg_table)
	if arg_table.force and arg_table.card.ability.ext_ovr then
		local sel_key = arg_table.card.ability.ext_ovr.overclock_counterpart
		arg_table.card:flip()
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 1,
			blocking = false,
			blockable = true,
			func = function()
				arg_table.card:juice_up(0.5,0.1)
				SMODS.calculate_effect({message = "Overclocked!",colour = G.C.BLUE},arg_table.card)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 2,
			blocking = false,
			blockable = true,
			func = function()
				local old_vals
				if arg_table.save then
					old_vals = arg_table.card.ability.extra
				end
				arg_table.card:set_ability(sel_key)
				arg_table.card.ability.old_extra = old_vals


				arg_table.card:flip()
				return true
			end

		}))
		if arg_table.card.ability.ext_ovr then
			arg_table.card.ability.ext_ovr = nil
		end
		CHAR.G.Overclock_Table[sel_key] = true
	end
	if arg_table.key then
		arg_table.card:flip()
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 1,
			blocking = false,
			blockable = true,
			func = function()
				arg_table.card:juice_up(0.5,0.1)
				SMODS.calculate_effect({message = "Overclocked!",colour = G.C.BLUE},arg_table.card)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 2,
			blocking = false,
			blockable = true,
			func = function()
				local old_vals
				if arg_table.save then
					old_vals = arg_table.card.ability.extra
				end

				arg_table.card:set_ability(arg_table.key)
				arg_table.card:flip()
				arg_table.card.ability.old_extra = old_vals
				return true
			end

		}))
		CHAR.G.Overclock_Table[arg_table.key] = true
	end
	play_sound('charcuterie_explosion',1.0,0.7)



end