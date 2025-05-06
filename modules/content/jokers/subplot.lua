-- Thanks to @gelopsys on discord for the art and code for this joker.
SMODS.Joker({
	loc_txt = {
		name = "Subplot",
		text = {
			"If a single {C:attention}played card{} does",
			"not score it permanently",
			"gains {X:mult,C:white}X#1#{} Mult",
		},
	},
	key = "subplot",
	atlas = ASPL.G.jokeratlas.key,
	pos = {
		x = 7,
		y = 0,
	},
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	unlocked = true,
	discovered = false,
	config = {
		extra = { x_mult = 0.2 },
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = { card.ability.extra.x_mult },
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == "unscored" then
			unscored_amount = #context.full_hand - #context.scoring_hand --checks how many unscored card there are
			if unscored_amount == 1 then
				context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
				context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult
								+ card.ability.extra.x_mult
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.RED,
				}
			end
		end
	end,
})
