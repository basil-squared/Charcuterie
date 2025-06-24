SMODS.Enhancement {
	key = "purified",
	loc_txt = {
		name = "Purified Card",
		text = { "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,", "{X:mult,C:white}x#3#{} Mult while held in hand." }
	},
	config = { extra = { chips = 30, mult = 4, hih_xmult = 1.5 } },
	atlas = ASPL.G.enhancementatlas.key,
	pos = { x = 2, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.hih_xmult } }
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.hand then
			return {
				xmult = card.ability.extra.hih_xmult
			}
		end
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult,
			}
		end
	end
}
