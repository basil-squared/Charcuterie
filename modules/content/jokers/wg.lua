SMODS.Joker {
	key = "aspl_wargames",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x=16,y=0},
	loc_txt = {
		name = "War Games",
		text = {"Gains {X:mult,C:white}X#1#{} Mult for every hand played","not containing an {C:astropulvis_unstable}Unstable{}  card.","{S:0.5,C:inactive}(deck must contain at least 5 unstable cards.){}","{S:0.5,C:inactive}(Currently {}{X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"}
	},
	config = { extra = {xmult = 0.5, curr_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.curr_xmult}}
	end,
	blueprint_compat = true,

	calculate = function(self,card,context)

		if context.joker_main then
			print("reached")
			local fh = context.full_hand
			for i=1, #fh do
				if SMODS.has_enhancement(fh[i],"m_astropulvis_unstable")then
					card.ability.extra.curr_xmult = 1.0
					return {
						message = "Reset"

					}
				end
			end
			card.ability.extra.curr_xmult = card.ability.extra.curr_xmult + card.ability.extra.xmult
			return {
				xmult = card.ability.extra.curr_xmult
			}
		end
	end
}