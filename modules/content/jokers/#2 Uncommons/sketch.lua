SMODS.Joker {
	key = 'sketch',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=69,y=0},
	config = {extra = {odds = 4,mult = 4}},
    loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, 1,card.ability.extra.odds,'police_sketch')
		return {vars = {num,denom, card.ability.extra.mult}}
	end,
	rarity = 2,
	cost =5,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play and context.other_card:is_face() then
			if SMODS.pseudorandom_probability(card,'wpefjkepfwfiopfepij',1,card.ability.extra.odds,'sketch_check') then
				return {
					xmult = card.ability.extra.mult
				}
			end
		end
	end
}