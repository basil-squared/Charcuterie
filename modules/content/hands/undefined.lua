SMODS.PokerHand {
    key = 'undefined',
    visible = false,
    mult = 2,
    chips = 15,
    l_chips = 5,
    l_mult = 1,
    example = {
        {'D_10', true, enhancement='m_charcuterie_rot'},
        {'S_J',true,seal='charcuterie_obscure'}
    },
    evaluate = function(parts, hand)
    local rankless = {}
    for i, card in ipairs(hand) do
      if
          SMODS.has_no_rank(card)
      then
        rankless[#rankless + 1] = card
      end
    end
    return #rankless >= 2 and { rankless } or {}
  end,
}