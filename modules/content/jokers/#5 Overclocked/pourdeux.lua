SMODS.Joker {
    key = "pour_deux",
    atlas = CHAR.G.overclockedatlas.key,
    pos = {x=5,y=0},
    config = { extra = {mult = 2, hand = "Pair"}},
    cost = 30,
    rarity = "charcuterie_overclocked",
    loc_vars = function(self,info_queue,card) 
        info_queue[#info_queue+1] = {set = "Other", key = 'char_txt_oc'}
        return {vars = {card.ability.extra.mult,localize(card.ability.extra.hand, 'poker_hands')}}
    end,
    calculate = function(self,card,context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.hand]) then
            
                return {
                    e_mult = card.ability.extra.mult
                }
            
        end
    end
}