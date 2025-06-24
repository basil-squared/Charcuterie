SMODS.Joker {
	key = "system_of_messages",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x=18,y=0},
	loc_txt = {
		name = "System of Messages",
		text = {"{X:mult,C:white}X#1#{} Mult for each {C:astropulvis_unstable}Unstable{} card in your {C:attention}full deck.{}","{S:0.5,C:inactive}(Currently {}{S:0.5,X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"}
	},
	rarity = 2,
	blueprint_compat = true,
	
	config = {extra = {xmult = 0.1, curr_xmult = 1.0}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult,card.ability.extra.curr_xmult}}
	end,
	calculate =  function(self,card,context)
		card.ability.extra.curr_xmult = (ASPL.FUNC.check_enhancement_deck("m_astropulvis_unstable") * card.ability.extra.xmult) + 1.0
		if context.joker_main then
			return {
				xmult = card.ability.extra.curr_xmult
			}

		end

	end
}
