local smods_has_no_rank_ref = SMODS.has_no_rank

---@diagnostic disable-next-line: duplicate-set-field
function SMODS.has_no_rank(card)
  if card.seal and card.seal == 'charcuterie_obscure' then
    return true
  end
  return smods_has_no_rank_ref(card)
end