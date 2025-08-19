
SMODS.Joker {
    key = 'phantom_ruby',
    pos = {x=9,y=1},
    atlas = CHAR.G.jokeratlas2.key,
    config = { extra = {counter = 0}},
    rarity = 3,
    
    calculate = function(self,card,context)
        if context.setting_blind  then
            if card.ability.extra.counter <= 0 then
                card.ability.extra.counter = 1
                SMODS.add_card({legendary = true,set = 'Joker'})
            elseif card.ability.extra.counter == 1 then
                card.ability.extra.counter = 2
                SMODS.add_card({rarity = 0.99,set='Joker'})
            elseif card.ability.extra.counter == 2 then
                card.ability.extra.counter = 3
                SMODS.add_card({rarity = 0.8,set='Joker'})
            else
                SMODS.add_card({rarity = 0, set = 'Joker'})
                SMODS.destroy_cards(card, true)
            end
            
            
        end
    end
    
    
}