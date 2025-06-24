local wh_wait_table = {}

SMODS.Joker {
    key = "aspl_wormhole",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x=12,y=0},
    loc_txt = {
        name = "Wormhole",
        text = {" {C:attention}sold{} Joker Will come back", "{C:attention}5{} rounds later as {C:dark_edition}Negative{}."}
    },
    
    rarity = 3,
    cost = 5,
    calculate = function(self,card,context)
        
        if context.selling_card then
            print(context.card.config.center.key)
            wh_wait_table[context.card.config.center.key] = 5
        end
        if context.end_of_round and context.cardarea == G.jokers then
            for k,_ in pairs(wh_wait_table) do
                if wh_wait_table[k] == 1 then
                 local spawned_joker = SMODS.add_card({set = 'Joker',key=k,edition = "e_negative"})
                 return {
                    message = "Teleported!"
                 }
                else
                    wh_wait_table[k] = wh_wait_table[k] - 1
                    return {
                        message = "In Process..."
                    }
                end
            end
        end
    end
}