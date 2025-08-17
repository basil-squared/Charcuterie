SMODS.PokerHand {
	key = "grayhouse",
	mult = 10,
	chips = 60,
	l_mult = 4,
    l_chips = 10,
	visible = false,
	example = {
		{ 'S_7', true, edition = "e_charcuterie_bleached" },  -- King of Spades, does not score
		{ 'H_7', true, edition = "e_charcuterie_bleached" },  -- 9 of Spades, scores
		{ 'D_7', true,  edition = "e_charcuterie_bleached" },             -- Negative Lucky 9 of Diamonds, scores
		{ 'H_3', true,  edition = "e_charcuterie_bleached"},             -- 6 of Hearts, does not score
		{ 'D_3', true, edition = 'e_charcuterie_bleached' }   -- Red Seal 3 of Diamonds, does not score
	},
	evaluate = function(parts, hand)
		local suitless = {}
		for i, card in ipairs(hand) do
			if
			SMODS.has_no_suit(card)
			then
				suitless[#suitless + 1] = card
			end
		end
		return #suitless >= 5 and { suitless } and parts._2 and parts._3 or {}
	end,
}
