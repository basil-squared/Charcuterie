SMODS.Joker {
    key = "redqueen",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x=56,y=0},
    rarity = 3,
    cost = 7,
    config = {extra = {base_xmult = 2, xmult_gain = 0.5, return_to_xmult = 2}},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.return_to_xmult, card.ability.extra.xmult_gain}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            
                if context.other_card ~= context.scoring_hand[#context.scoring_hand] then
                    card.ability.extra.base_xmult = card.ability.extra.base_xmult + card.ability.extra.xmult_gain
                    return {
                        message = localize('k_upgrade_ex'),
                        card = card,
                        colour = G.C.RED,
                    }
                else
                    local _temp_xm = card.ability.extra.base_xmult
                    
                    return {
                        card = card,
                        xmult = _temp_xm
                    }
                end

            end
        if context.final_scoring_step then
            card.ability.extra.base_xmult = card.ability.extra.return_to_xmult
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
    
}