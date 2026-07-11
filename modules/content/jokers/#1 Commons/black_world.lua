SMODS.Joker {
    key = 'letter_black',
    pos = { x = 0, y = 1  },
	atlas = CHAR.G.jokeratlas2.key,
	rarity = 1,
	blueprint_compat = true,
	cost = 3,
    config = { extra = { mult = 4}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'char_txt_suitless'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'char_txt_rankless'}
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_no_suit(context.other_card) and SMODS.has_no_rank(context.other_card) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}