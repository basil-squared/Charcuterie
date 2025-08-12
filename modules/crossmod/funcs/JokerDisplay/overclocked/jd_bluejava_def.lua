jd_def['j_charcuterie_blue_java'] = {
    text = {
        {border_nodes = {
            {text = "X", colour = G.C.WHITE},
            {ref_table = 'card.ability.extra', ref_value = 'xmult',retrigger_type = 'exp'}
        }}
    },
    extra = {{
        {text = '('},
        {ref_table = 'card.joker_display_values',ref_value = "odds"},
        {text = ')'},
    }},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
    },
    calc_function = function(card)
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,'blue_javajd')
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = {num,denom}}
    end
}