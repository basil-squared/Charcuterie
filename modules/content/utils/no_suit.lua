local smods_has_no_suit_ref = SMODS.has_no_suit
---@diagnostic disable-next-line: duplicate-set-field
function SMODS.has_no_suit(card)
  if card.edition and card.edition.type == "charcuterie_bleached" then
    return true
  end
  if G.GAME.blind then
    if G.GAME.blind.config.blind.key == "bl_charcuterie_the_dip" then
      return true
    end
  end
  return smods_has_no_suit_ref(card)
end -- Function hooking is very handy to get something to do what you want.