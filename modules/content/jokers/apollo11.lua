SMODS.Joker {
    key = "apollo11",
    atlas = ASPL.G.jokeratlas.key,
    pos = {x=12,y=0},
    loc_txt = {
        name = "Apollo 11",
        text = {"{C:mult}+#1#{} Mult if played hand contains 3 {C:astropulvis_galactical}Galactical{} cards."}
    },
    blueprint_compat = true,
    config = {extra = {mult = 11}},
    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.mult}}
    end,
    calculate = function(self,card,context) 
        if context.joker_main then
            local fh = context.full_hand
            local galactical_cd = {}
            for i=1,#fh do
                if SMODS.has_enhancement(fh[i], "m_astropulvis_galactical") then
                    table.insert(galactical_cd,fh[i])
                end 
            end
            if #galactical_cd >= 3 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}