SMODS.Joker({
	atlas = ASPL.G.jokeratlas.key,
	pos = { x = 13, y = 0 },
	key = "halley_comet",
	config = { extra = { to_generation = 5 } },
	rarity = 3,
	loc_txt = {
		name = "Halley's Comet",
		text = {
			"For every {C:attention}5{} Hands played,",
			"generate 3 {C:dark_edition}Negative{} {C:planet}Planet Cards{} for your",
			"{C:attention}most played{} hand.",
			"{S:0.7,C:inactive}(currently #1#){}",
		},
	},
	loc_vars = function(self,info_queue,card)
		return {vars={self.config.to_generation}}
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

				SMODS.add_card({key = shitting_planet_name, edition = "e_negative"})
				SMODS.add_card({key = shitting_planet_name, edition = "e_negative"})
				SMODS.add_card({key = shitting_planet_name, edition = "e_negative"})
				self.config.extra.to_generation = 5
				return {
					message = "Reset",
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
