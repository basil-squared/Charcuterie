SMODS.Joker {
    key = 'fading',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x = 3, y= 0},
    config = {extra = {basenum = 1, basedenom = 10}},
    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card,card.ability.extra.basenum,card.ability.extra.basedenom,'charcuterie_fading')
        info_queue[#info_queue+1] = {set = "Edition",key='e_charcuterie_bleached'}
        return { vars = {num,denom}}
    end
}