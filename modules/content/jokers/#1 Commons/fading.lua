SMODS.Joker {
    key = 'fading',
    atlas = CHAR.G.jokeratlas2.key,
    pos = {x = 3, y= 0},
    config = {extra = {basenum = 1, basedenom = 10}},
    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card,card.ability.extra.basenum,card.ability.extra.basedenom,'charcuterie_fading')
        info_queue[#info_queue+1] = {set = "Edition",key='e_charcuterie_bleached',config = {}}
        return { vars = {num,denom}}
    end,
    rarity = 1,
    cost = 4,
    calculate = function(self,card,context)
        if context.discard then
            if SMODS.pseudorandom_probability(card,'fading_charcuterie',card.ability.extra.basenum,card.ability.extra.basedenom,'fading_charcuterie') then
                if not context.other_card:get_edition() then
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.2,
                        func = function()
                            
                            
                            context.other_card:set_edition("e_charcuterie_bleached")
                            
                            return true
                        end
                    }))
                   
                    
                end
            end
        end
    end
}