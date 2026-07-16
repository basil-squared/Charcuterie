local get_straight_ref = get_straight

function get_straight(hand,min_length,skip,wrap)
    local censor_cards = SMODS.find_card('j_charcuterie_censor')
    if next(censor_cards) then
        local censor = censor_cards[1]
        -- i read gap size off of the joker because i want to support jokers that change values
        local gap_size = censor.ability.extra.gap_size
        local rankless_cards = {}
        for _, card in ipairs(hand) do
            if SMODS.has_no_rank(card) then
                rankless_cards[#rankless_cards+1] = card
            end    
        end
        -- basically to mimick the behavior of 'fufilling' a straight we check through each rank to find one that fits. 
        -- functionally, rankless cards turn into 'wild rank' for straight scoring here!
        if #rankless_cards >= gap_size then
            for start_rank_i = 1, #SMODS.Rank.obj_buffer - gap_size + 1 do
                local overrides = {}
                for offset = 0, gap_size - 1 do
                    local rank_key = SMODS.Rank.obj_buffer[start_rank_i + offset]
                    local target_id = SMODS.Ranks[rank_key].id
                    local c = rankless_cards[offset+1]
                    overrides[#overrides+1] = { card = c, original = c.get_id}
                    c.get_id = function() return target_id end

                end 
                local result = get_straight_ref(hand,min_length,skip,wrap)
                -- restoring the original get id func
                for _,o in ipairs(overrides) do
                    o.card.get_id = o.original
                end

                if next(result) then return result end
            end
            
        end
    end
    return get_straight_ref(hand,min_length,skip,wrap)
end