SMODS.Joker {
	key = "schematic",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x = 30,y=0},
	loc_txt = {
		name = "Schematic",
		text = {"Copies ability of","{C:attention}Joker{} to the left"}
	},
	rarity = 3,
	cost = 10,
	config = {extra = {retrigger_amt = 1}},
	calculate = function(self,card,context)
		local index
		for i=1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				index = i

			end

		end
		if index > 1 and index < #G.jokers.cards then
			left_joker = G.jokers.cards[index - 1]
			if left_joker and left_joker ~= self and left_joker.config.center.blueprint_compat then
				card.ability.blueprint_compat = 'compatible'

			else
				card.ability.blueprint_compat = 'incompatible'
			end
		end
		-- TODO: Finish this later.
	end
}