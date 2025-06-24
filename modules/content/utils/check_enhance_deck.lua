function CHAR.FUNC.check_enhancement_deck(enhancement)
  local tablerer = {}
  for i = 1, #G.playing_cards do
    if SMODS.has_enhancement(G.playing_cards[i], enhancement) then
      table.insert(tablerer, G.playing_cards[i])
    end
  end
  return #tablerer
end