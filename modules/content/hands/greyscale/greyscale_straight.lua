SMODS.PokerHand {
  key = "graystraight",
  mult = 12,
  chips = 70,
  l_mult = 5,
  l_chips = 20,
  example = {
    { 'S_7', true, edition = "e_astropulvis_bleached" },  -- King of Spades, does not score
    { 'H_6', true, edition = "e_astropulvis_bleached" },  -- 9 of Spades, scores
    { 'D_5', true,  edition = "e_astropulvis_bleached" },             -- Negative Lucky 9 of Diamonds, scores
    { 'H_4', true,  edition = "e_astropulvis_bleached"},             -- 6 of Hearts, does not score
    { 'D_3', true, edition = 'e_astropulvis_bleached' }   -- Red Seal 3 of Diamonds, does not score
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
    return #suitless >= 5 and { suitless } and parts._straight or {}
  end,
}
