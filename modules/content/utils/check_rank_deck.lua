function CHAR.FUNC.check_rank_deck(rank)
  local tablerer = {}
  for i = 1, #G.playing_cards do
    if G.playing_cards[i]:get_id() == rank then
      table.insert(tablerer, G.playing_cards[i])
    end
  end
  return #tablerer
end