SMODS.Back {
	key = 'turbo',
	config = {ante_scaling_if_it_was_awesome = 4, pricecut = 2},
	loc_vars = function(self,info_queue,back)
		return {vars = {self.config.ante_scaling, 100 / self.config.pricecut}}
	end,
	unlocked = false,
    check_for_unlock = function(args)
        for _, key in pairs(CHAR.G.OVERCLOCK_MAP) do
            if not (G.P_CENTERS[key] and G.P_CENTERS[key].unlocked) then
                return false
            end
        end
        return true
    end,
	atlas = CHAR.G.deckatlas.key,
	pos = {x=3,y=0},
	apply = function(self,back) 
		CHAR.FUNC.set_blind_scale(back.key,self.config.ante_scaling_if_it_was_awesome)
		CHAR.FUNC.add_cost_entry('turbo_deck', function(card)
    		return card.ability and card.ability.set == "Joker" and card.config.center.rarity == 'charcuterie_overclocked'
		end, (1 / self.config.pricecut))
	end


}
