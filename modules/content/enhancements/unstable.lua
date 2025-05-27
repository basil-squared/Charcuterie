SMODS.Enhancement {
	key = "unstable",

	atlas = CHAR.G.enhancementatlas.key,
	config = { extra = { odds = 4, xmult = 4, card_num = 2} },
	pos = {x=3,y=0},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.card_num } }
	end,

	calculate = function(self,card,context)
		if next(SMODS.find_card("j_charcuterie_reactor_rod")) then
			card.ability.extra.xmult = 6
			card.ability.extra.card_num = 4
		end
		if context.main_scoring and context.cardarea == G.play then
			if pseudorandom('radioactive') < G.GAME.probabilities.normal / card.ability.extra.odds then
				for i=1, card.ability.extra.card_num do
					_card = create_playing_card({

					})
					_card:set_seal("charcuterie_lime")
					G.deck:emplace(_card)
					G.deck.config.card_limit = G.deck.config.card_limit + 1




				end
				SMODS.calculate_context({unstable_proc = true})
				return {
					xmult = card.ability.extra.xmult,
					message = "Zzzt!"
				}
			end
			return {
				xmult = card.ability.extra.xmult


			}
		end
	end

}