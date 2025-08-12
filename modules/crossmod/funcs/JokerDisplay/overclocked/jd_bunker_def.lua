jd_def['j_charcuterie_bunker'] = {
    text  = {
        {
            border_nodes = {
                {text = "X", colour = G.C.WHITE},
                {ref_table = 'card.ability.extra', ref_value = 'curr_xchip', colour = G.C.WHITE},
                
            },
            border_colour = G.C.CHIPS
        }
        
    },
    reminder_text = {
        {text = "("},
        { ref_table = "card.joker_display_values", ref_value = "bunker_card_suit"},
        { text = ")"},
    },
    calc_function = function(card)
        card.joker_display_values.bunker_card_suit = localize(CHAR.G.current_bunker_suit, 'suits_singular')
    end,
    style_function  = function(card,text,reminder_text,extra)
        if reminder_text and reminder_text.children[2] then
            reminder_text.children[2].config.colour = lighten(G.C.SUITS[CHAR.G.current_bunker_suit],0.35)
        end
    end

    } 



