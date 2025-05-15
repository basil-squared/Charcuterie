SMODS.Joker {
    key = "mothership",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x=12,y=0},
    loc_txt = {
        name = "Mothership",
        text = {"{X:mult,C:white}X#1#{} Mult for each","{C:astropulvis_galactical}Galactical{} Card in your {C:attention}Full Deck{}","{S:0.5,C:inactive}(Currently{} {X:mult,C:white,S:0.5}X#2#{}{S:0.5,C:inactive} Mult){}"}

    },
    rarity = 2,
    
    config = {extra = {xmult = 0.2, curr_xmult = 1.0}},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.curr_xmult}}
    end,
    calculate =  function(self,card,context)
		card.ability.extra.curr_xmult = (ASPL.FUNC.check_enhancement_deck("m_astropulvis_galactical") * card.ability.extra.xmult) + 1.0
		if context.joker_main then
			return {
				xmult = card.ability.extra.curr_xmult
			}

		end

	end

}