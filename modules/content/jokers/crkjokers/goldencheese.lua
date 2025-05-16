SMODS.Joker {
    key="goldencheese",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x =21, y = 0  },
    loc_txt = {

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