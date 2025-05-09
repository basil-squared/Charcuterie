SMODS.Joker {
    key = "starchild",
    atlas = ASPL.G.jokeratlas.key,
    pos= {x=12,y=0},
    loc_txt = {
        name = "Starchild",
        text = {"{C:chips}+#1#{} Chips and {C:mult}+#2#{} for every {C:astropulvis_galactical}Galactical{} Face card played."},
    },
    config = {extra =  {chips = 10, mult = 4 }},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() and SMODS.has_enhancement(context.other_card, "m_astropulvis_galactical") then
            return {
                chips = card.ability.chips,
                mult = card.ability.mult
            }
        end
   end
}