SMODS.Joker {
    key = 'providence',
    atlas = CHAR.G.overclockedatlas.key,
    pos = { x = 16,y=0},
    config = {extra = { xmult = 4}},
    unlocked = false,
    check_for_unlock = function (self, args)
        return G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_providence']
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = "Other",key = 'char_txt_oc'}
        local most_played
        if G and G.playing_cards then
            most_played = localize(CHAR.FUNC.check_played_rank_deck(G.playing_cards).rank, 'ranks')
        else
            most_played = 'None'
        end
        return {
            vars = {
                most_played,
                card.ability.extra.xmult
            }
        }
    end,
    rarity = 'charcuterie_overclocked',
    cost = 30,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then
            local mp = CHAR.FUNC.check_played_rank_deck(G.playing_cards)
            
            if context.other_card:get_id() == mp.id then
                return {
                    xmult = card.ability.extra.xmult
                }
            end

        end
        
    end


}