SMODS.Joker {
    key = "starchild",
    atlas = ASPL.G.jokeratlas.key,
    pos= {x=28,y=0},
    loc_txt = {

    },
    config = {extra =  {chips = 19, mult = 7.3 }},
    rarity = 2,
    blueprint_compat = true,
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() and SMODS.has_enhancement(context.other_card, "m_astropulvis_galactical") then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
   end
}