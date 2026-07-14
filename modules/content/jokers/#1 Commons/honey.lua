SMODS.Joker {
    key = 'honey',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x=2,y=1},
    rarity = 1,
    cost = 4,
    config = {extra = {curr_sell_value = 4}},
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.curr_sell_value
            }
        }
    end,
    calculate = function(self,card,context)
        if context.selling_card then
            -- im pretty sure this is always true but im checking anyways
            if context.card ~= card then
                if context.card.sell_cost then
                    card.ability.extra.curr_sell_value = context.card.sell_cost + card.ability.extra.curr_sell_value
                    card.sell_cost = card.ability.extra.curr_sell_value
                    return {
                        message = localize("k_upgrade_ex")
                    }
                    
                end
                
            end
        end
    end
}