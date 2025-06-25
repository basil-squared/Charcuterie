SMODS.Joker {
    key = 'tidal_wave',
    atlas = CHAR.G.jokeratlas.key,
    pos = {x=81,y=0},
    rarity = 3,
    config = {extra = {mult_gain = 0.02, curr_mult = 1.0}},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult_gain, card.ability.extra.curr_mult}}
    end,
    calculate = function(self,card,context)
        local total_rank = 0
        if context.before then
            if (#context.scoring_hand % 2) ~= 0  then
                for i=1, #context.scoring_hand do
                    total_rank = context.scoring_hand[i]:get_id() + total_rank
                end
                card.ability.extra.curr_mult =  (total_rank * card.ability.extra.mult_gain) + card.ability.extra.curr_mult
                return {
                    message = localize('k_upgrade_ex')
                }
            end 
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.curr_mult
            }
        end
    end

}