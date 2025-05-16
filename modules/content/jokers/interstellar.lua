SMODS.Joker {
	key = "interstellar",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x=29,y=0},

	rarity = 1,
	cost = 4,
	config = {extra = {mult = 5}},
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult}}
	end,

	calculate = function(self,card,context)

		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card,"m_astropulvis_galactical") then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}