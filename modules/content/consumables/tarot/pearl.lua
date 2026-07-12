SMODS.Consumable {
    key = 'pearl',
    atlas = CHAR.G.tarotatlas.key,
    pos = {x=10,y=0},
    set = 'Tarot',
    config = {max_highlighted = 1, mod_conv = "m_charcuterie_rot"},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}