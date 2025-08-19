SMODS.Enhancement {
    key = 'frostbitten',
    atlas = CHAR.G.enhancementatlas.key,
    pos = {x=10,y=0},
    config = {extra = {reduction = 1}},
    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.reduction}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            CHAR.FUNC.ease_risk(-1)
            return {
                message = "Reduced!",
                colour = G.C.GREEN
            }
        end
    end
}