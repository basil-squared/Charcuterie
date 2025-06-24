SMODS.Joker({
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 13, y = 0 },
	key = "halley",
	config = { extra = { to_generation = 5, cards_generated = 3 } },
	rarity = 3,
	blueprint_compat = true,

	loc_vars = function(self,info_queue,card)
		return {vars={self.config.extra.to_generation}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local shitting_planet_name = 0
			local mp_hand = ASPL.FUNC.fetch_most_played()
			for k,v in pairs(G.P_CENTER_POOLS.Planet) do
				if v.config.hand_type == mp_hand then
					shitting_planet_name = v.key
				end
			end
			if self.config.extra.to_generation == 1 then
				for i = 1, card.ability.extra.cards_generated do
					SMODS.add_card({key = shitting_planet_name, edition = "e_negative"})
				end
				
				self.config.extra.to_generation = 5
				return {
					message = "Reset",
					colour = G.C.PURPLE,
				}


			else
				self.config.extra.to_generation = self.config.extra.to_generation - 1
				return {
					message = tostring(self.config.extra.to_generation) .. " Remaining",
				}
			end
		end
	end,
})
