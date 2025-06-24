SMODS.Joker {
	key = "bloatware",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x=19,y=0},
	loc_txt = {
		name = "Bloatware",
		text = {"{X:purple,C:white}X#1#{} {C:chips}Chips{} and {C:mult}Mult{}.","{C:green}#2# in #3#{} chance to spawn 2 {C:red}Debuffed{} cards into your hand."}
	},
	config = { extra = {xchips_and_mult = 3, odds = 10}},
	rarity = 2,
	cost = 5,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips_and_mult, (G.GAME.probabilities.normal or 1),card.ability.extra.odds}}

	end
}