---@param cards Card[]
---@return table <number|string,number>
function CHAR.FUNC.check_played_rank_deck(cards)
    
    local cards_played_bleh = {}
    local cards_id_played = {}
    local highest_played_val = 'None'
    local highest_played_id = 1
    local highest_played_num = -2 --why cant i just use a small number? fuck you
    for  k,_ in ipairs(cards) do
        if not cards_played_bleh[cards[k].base.value] then
            cards_played_bleh[cards[k].base.value] = 0
        end
        if not cards_id_played[cards[k].base.id] then
            cards_id_played[cards[k].base.id] = 0
        end
        --cards_played_bleh[cards[k].base.value] = (cards[k].base.times_played > 0 and cards_played_bleh[cards[k].base.value] + cards[k].base.times_played) or 0
        cards_played_bleh[cards[k].base.value] = (cards[k].base.times_played > 0 and cards_played_bleh[cards[k].base.value] + cards[k].base.times_played) or cards_played_bleh[cards[k].base.value]
        cards_id_played[cards[k].base.id] = (cards[k].base.times_played > 0 and cards_id_played[cards[k].base.id] + cards[k].base.times_played) or cards_id_played[cards[k].base.id]
    end
    
    for k,_ in pairs(cards_played_bleh) do
        if cards_played_bleh[k] > highest_played_num then
            
            highest_played_val = k
            highest_played_num = cards_played_bleh[k]
            
        end
    end
    for k,_ in pairs(cards_id_played) do
        if cards_id_played[k] >= highest_played_num then
            highest_played_id = k
            
        end
    end
   
    return {rank = highest_played_val, id = highest_played_id}
    
end
