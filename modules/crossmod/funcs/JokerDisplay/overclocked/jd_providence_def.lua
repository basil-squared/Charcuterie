jd_def['j_charcuterie_providence'] = {
    text = {
        {ref_table = 'card.joker_display_values',ref_value = 'count', retrigger_type = 'mult'},
        {text  = 'x'},
        {
            border_nodes = {
                {text = 'X'},
                {ref_table = 'card.ability.extra',ref_value = 'xmult'}
            }
        }
    },
    reminder_text = {
        {text='('},
        {ref_table = 'card.joker_display_values',ref_value = 'curr_rank', colour = G.C.GOLD},
        {text = ')'}
    },
    reminder_text_config = {
        scale = 0.5
    },
    calc_function = function(card)
        local count = 0
        local mp = {rank = 'None', id = 0}
        
        if G.play then
            local text,_,scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                if G.playing_cards then
                    mp = CHAR.FUNC.check_played_rank_deck(G.playing_cards)
                    for _,v in pairs(scoring_hand) do
                        if v:get_id() == mp.id then
                            count = count + JokerDisplay.calculate_card_triggers(v,scoring_hand)
                        end
                    end
                end
            end
        else
            count = 0
            mp.rank = 'None'
        end
        card.joker_display_values.curr_rank = mp.rank
        card.joker_display_values.count  = count 
    end
}