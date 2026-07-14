SMODS.Enhancement {
	key = "unstable",

	atlas = CHAR.G.enhancementatlas.key,
	config = { extra = { numerator = 1, odds = 4, xmult = 4, card_num = 2} },
	pos = {x=3,y=0},
	loc_vars = function(self, info_queue, card)
		local num,denom = SMODS.get_probability_vars(card,card.ability.extra.numerator,card.ability.extra.odds,"unstable cards")

		return { vars = { card.ability.extra.xmult, num, denom, card.ability.extra.card_num } }
	end,

	calculate = function(self,card,context)
		if next(SMODS.find_card("j_charcuterie_reactor_rod")) then
			card.ability.extra.xmult = 6
			card.ability.extra.card_num = 4
		end
		if context.main_scoring and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card,"radioactive",card.ability.extra.numerator,card.ability.extra.odds,"unstable cards") then
				for i=1, card.ability.extra.card_num do
					local _card = create_playing_card({

					})
					-- needed for proper context stuff for smods :b
					playing_card_joker_effects({_card})
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