jd_def['j_charcuterie_infinite_ball'] = {
    text = {
        {text = '('},
        {text = 'Spectral', colour = G.C.SPECTRAL},
        {text = ')'},
    },
    extra = {{
        {text = '('},
        {ref_table = 'card.joker_display_values',ref_value = 'odds'},
        {text = ')'}
    }},
    reminder_text = {
        {text = '('},
        {text = 'Scored 8s', colour = G.C.GOLD},
        {text = ')'}
    },
    extra_config = {
        scale = 0.3,
        colour = G.C.GREEN
    },
    reminder_text_config = {
        scale = 0.5

    },
    calc_function = function(card)
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,'infball')
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = {num,denom}}
    end
}