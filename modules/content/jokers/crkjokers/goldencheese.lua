SMODS.Joker {
    key="golden_cheese",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x =21, y = 0  },
    loc_txt = {
        name = "Golden Cheese Cookie",
        text = {"Earn {C:attention}double the money!{}","{S:0.5,C:inactive}'Divine Radiance!'"}
    },
    rarity = 4,
    cost = 10,
    blueprint_compat = false,
    calculate = function(self,context,card)
        if context.gc_proc then
            return {
                message = "Doubled!",

            }
        end
    end


}