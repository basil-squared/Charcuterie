SMODS.Joker {
    key = "mothership",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x=76,y=0},

    rarity = 2,
    
    config = {extra = {xmult = 0.2, curr_xmult = 1.0}},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.curr_xmult}}
    end,
    calculate =  function(self,card,context)
		card.ability.extra.curr_xmult = (CHAR.FUNC.check_enhancement_deck("m_charcuterie_galactical") * card.ability.extra.xmult) + 1.0
		if context.joker_main then
			return {
				xmult = card.ability.extra.curr_xmult
			}

		end

	end

}