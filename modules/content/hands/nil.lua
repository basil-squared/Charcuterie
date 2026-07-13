SMODS.PokerHand {
    key = 'nil',
    chips = 40,
    mult = 5,
    l_chips =12,
    l_mult = 2,
    visible = false,
    example = {
        {'S_7', false},
        {'D_10', true, enhancement='m_charcuterie_rot'},
        {'S_J',true,seal='charcuterie_obscure'},
        {'H_4', true, enhancement='m_stone'},
        {'C_K',true,enhancement='m_charcuterie_rot'}
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
    return #rankless >= 4 and { rankless } or {}
  end,
}