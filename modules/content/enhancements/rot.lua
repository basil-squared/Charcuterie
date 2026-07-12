SMODS.DrawStep {
    key = 'rot_overlay',
    order = 35,
    func = function(self, layer)
    if SMODS.has_enhancement(self, 'm_charcuterie_rot') then
        CHAR.G.rot_overlay_sprite = CHAR.G.rot_overlay_sprite or Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS[CHAR.G.enhancementatlas.key], {x = 11, y = 0})
        CHAR.G.rot_overlay_sprite.role.draw_major = self
        CHAR.G.rot_overlay_sprite.role.major = self
        CHAR.G.rot_overlay_sprite:draw_shader('charcuterie_rot_suit', nil, nil, nil, self.children.center)
    end
    end,
    conditions = { vortex = false, facing = 'front'}
}

SMODS.Enhancement {
    key = 'rot',
    atlas = CHAR.G.enhancementatlas.key,
    pos = {x=10, y=0},
    config = {extra = {base_num = 1, replicate_denom = 8, destroy_denom = 4,xmult = 3}},
    loc_vars = function(self,info_queue,card)
        local num, rep_denom = SMODS.get_probability_vars(card,card.ability.extra.base_num,card.ability.extra.replicate_denom,"rot_replicate")
        local _,destroy_denom = SMODS.get_probability_vars(card,card.ability.extra.base_num,card.ability.extra.destroy_denom,"rot_destroy")
        return {
            vars = {
                num,
                rep_denom,
                destroy_denom,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            -- roll for clone first
            if SMODS.pseudorandom_probability(card,"therotiscoming",card.ability.extra.base_num,card.ability.extra.replicate_denom,'rot_enchantment') then
                local possible_cards = {}
                for k,v in ipairs(context.scoring_hand) do
                    if not (v == card) then
                        possible_cards[#possible_cards+1] = v
                    end
                end
                if #possible_cards > 0 then
                    local selnum = pseudorandom("therotisntcoming",1,#possible_cards)
                    if not SMODS.has_enhancement(possible_cards[selnum],'m_charcuterie_rot') then
                        possible_cards[selnum]:set_ability(G.P_CENTERS['m_charcuterie_rot'], true, true)
                        return {
                            message = localize("k_infected_ex")
                        }
                    end
                end
                
            end
            -- then roll for self destruction
        end
    end

}