SMODS.Consumable {
    key = "summon",
    set = 'ritual',
    atlas = CHAR.G.ritualatlas.key,
    pos = {x =1,y=1},
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
		local stupid_list = {a=1,b=2,c=3}
        local victims = {}
        for i=1,3 do
            victims[i] = pseudorandom_element(potential_victims,pseudoseed("OEUIFGUNHWEOUFN"))
			victims[i].getting_sliced = true
		end
		if not victims then
			return
		end -- Safety check

		
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
        if CHAR.FUNC.negative_event_proc(G.GAME.Risk or 0) == false  then
            
        else 
            SMODS.add_card({set = 'Joker',legendary=true})
        end

    end,
    can_use = function(self, card)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then -- can_calculate just checks to ensure that the joker isnt getting wiped already
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end
		return #potential_victims >= 2
	end,



}