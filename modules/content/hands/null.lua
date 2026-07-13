SMODS.PokerHand {
    key = 'null',
    chips = 40,
    mult = 5,
    l_chips =12,
    l_mult = 2,
    visible = false,
    example = {
        {'S_7', true,enhancement='m_charcuterie_rot',edition='e_charcuterie_bleached'},
        {'D_10', true, enhancement='m_charcuterie_rot',edition='e_charcuterie_bleached'},
        {'S_J',true,seal='charcuterie_obscure',edition='e_charcuterie_bleached'},
        {'H_4', true, enhancement='m_stone'},
        {'C_K',true,enhancement='m_charcuterie_rot',edition='e_charcuterie_bleached'}
    },
    evaluate = function(parts, hand)
    local rankless = {}
    local suitless = {}
    for i, card in ipairs(hand) do
      if
          SMODS.has_no_rank(card)
      then
        rankless[#rankless + 1] = card
      end
      if SMODS.has_no_suit(card) then
        suitless[#suitless+1] = card
      end
    end
    return (#rankless >= 5 and { rankless } or {}) and (#suitless >= 5 and { suitless } or {})
  end,
}