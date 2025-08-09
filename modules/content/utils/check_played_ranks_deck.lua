function CHAR.FUNC.check_played_rank_deck(cards)
    local cards_played_bleh = {}
    local cards_id_played = {}
    local highest_played_val = 'None'
    local highest_played_id = 1
    local highest_played_num = math.mininteger
    for  k,_ in ipairs(cards) do
        
        cards_played_bleh[cards[k].base.value] = cards_played_bleh[cards[k].base.value] + cards[k].base.times_played
        cards_id_played[cards[k].base.id] = cards_played_bleh[cards[k].base.id] + cards[k].base.times_played
    end
    
    for k,_ in pairs(cards_played_bleh) do
        if cards_played_bleh[k] > highest_played_num then
            highest_played_val = k
        end
    end
    for k,_ in pairs(cards_id_played) do
        if cards_id_played[k] > highest_played_num then
            highest_played_id = k
        end
    end
    return {rank = highest_played_val, id = highest_played_id}
    
end
