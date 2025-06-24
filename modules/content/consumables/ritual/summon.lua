SMODS.Consumable {
    key = "summon",
    set = 'ritual',
    atlas = ASPL.G.ritualatlas.key,
    pos = {x =6,y=0},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aspl_txt_risk'}
        return { vars = { tostring((1 - (G.GAME.Risk or 0) ) * 100), tostring((G.GAME.Risk or 0) * 100) } }
    end,
    use = function(self, card, area, copier)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end
        local victims = {}
        for i=1,3 do
            table.insert(potential_victims, pseudorandom_element)
		end
		if not victims then
			return
		end -- Safety check

		victims.getting_sliced = true
		G.GAME.joker_buffer = G.GAME.joker_buffer - 3

		-- Store reference in local variable for closure
		local dissolve_targets = victims
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			blockable = false,
			func = function()
                for i=1,#dissolve_targets do
                    if dissolve_targets[i] and dissolve_targets[i].start_dissolve then

                        dissolve_targets[i]:start_dissolve()
                    end
                end
				
				G.GAME.joker_buffer = 0
				return true
			end,
		}))
        if ASPL.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
            return {
                message = "Nope!",
                colour = G.C.purple
            }
        else 
            SMODS.add_card({set = 'Joker',rarity =4})
        end

    end,
    can_use = function(self, card)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end
		return #potential_victims > 2
	end,



}