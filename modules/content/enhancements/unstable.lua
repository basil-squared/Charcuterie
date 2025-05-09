SMODS.Enhancement {
	key = "unstable",
	loc_txt = {
		name = "Unstable Card",
		text = {"{X:mult,C:white}X#1#{} Mult.","{C:green}#2# in #3# {}chance to add two more"," {C:astropulvis_unstable}Unstable{} cards to the deck."}
	},
	atlas = ASPL.G.enhancementatlas.key,
	config = { extra = { odds = 4, xmult = 4 } },
	pos = {x=3,y=0},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,

	calculate = function(self,card,context)
		if context.main_scoring and context.cardarea == G.play then
			if pseudorandom('radioactive') < G.GAME.probabilities.normal / card.ability.extra.odds then
				local _card = create_playing_card({

				})
			end
			return {
				xmult = card.ability.extra.xmult

			}
		end
	end

}