CHAR.FUNC.check_suits_deck = function()
	local cards_of_suits = {}
	for  i=1,#G.playing_cards do
		if not SMODS.has_no_suit(G.playing_cards[i]) then
			cards_of_suits[G.playing_cards[i].base.suit] = (cards_of_suits[G.playing_cards[i].base.suit] or 0) + 1

		end


	end
	return cards_of_suits
end