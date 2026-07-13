SMODS.PokerHand {
    key = 'void',
    chips = 25,
    mult = 3,
    l_chips =8,
    l_mult = 1,
    visible = false,
    example = {
        {'S_7', false},
        {'D_10', true, enhancement='m_charcuterie_rot'},
        {'S_J',true,seal='charcuterie_obscure'},
        {'H_4', true, enhancement='m_stone'},
        {'C_K',false}
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
    return #rankless >= 3 and { rankless } or {}
  end,
}