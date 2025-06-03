local get_card_to_right = function(cards,card)
	local index
	for i=1, #cards do
		if cards[i] == card then
			index = i + 1

		end
			
	end
	return index or 0
end

SMODS.Enhancement {
	key = "arc",
	config = {extra = {odds = 3}},
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 4, y = 0 },
	loc_vars = function(self,info_queue,card)
		return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,
	calculate = function(self,card,context)
		if context.cardarea == G.play and context.repetition and pseudorandom("guhthbrshzhb") < G.GAME.probabilities.normal / card.ability.extra.odds   then
				local _card = context.scoring_hand[get_card_to_right(context.full_hand,card)]
				if not _card then return  end
                return {
                    card_eval_status_text(_card, 'extra', nil, nil, nil, {
                        message = 'Again!',
                        colour = G.C.MONEY,
                    }),
                    SMODS.score_card(_card, {cardarea = G.play, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands}),
					SMODS.score_card(_card, {cardarea = G.play, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands}),
					SMODS.score_card(_card, {cardarea = G.play, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands})
                }
            end
        
    

	end
}