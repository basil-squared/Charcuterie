SMODS.Joker {
	key = 'aphantasia',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=58,y=0},
	
	
	rarity = 3,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.is_face(context.other_card) then
                context.other_card:set_seal('charcuterie_obscure')
                return {
                    message  = "Obscured!",
                    card = card,
                }
            end
        end
    end
	

}