SMODS.Joker {
    key="golden_cheese",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x =21, y = 0  },
    loc_txt = {
        name = "Golden Cheese Cookie",
        text = {"Earn {X:attention,C:white}X2{} dollars","{S:0.5,C:inactive}'Divine Radiance!'"}
    },
    rarity = "astropulvis_ancient",
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