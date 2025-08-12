jd_def['j_charcuterie_pour_trois'] = {
    text = {
        {
            border_nodes = {
                {text = '^'},
                {ref_table = 'card.ability.extra', ref_value = 'mult'},

            },
            border_colour = G.C.DARK_EDITION
        }
    },
    reminder_text = {
        {text = '('},
        {ref_table = 'card.joker_display_values',ref_value = 'localized_text', colour = G.C.GOLD},
        {text = ')'},
    },
    reminder_text_config = {
        scale = 0.5
    },
    calc_function = function (card)
        card.joker_display_values.localized_text = localize(card.ability.extra.hand, 'poker_hands')
        
    end
}