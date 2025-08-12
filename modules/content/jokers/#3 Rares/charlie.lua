SMODS.Joker {
	key = 'charlie',
	atlas = CHAR.G.jokeratlas2.key,
	pos = {x=6,y=0},
	config = {extra = {cards_genned = 2}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.cards_genned}}
	end,
	unlocked = false,
	rarity = 3,
	cost = 7,
	calculate = function(self,card,context)
		if context.using_consumeable then
			if context.consumeable.ability.set == 'Spectral' then
				for i = 1, math.min(card.ability.extra.cards_genned, G.consumeables.config.card_limit - #G.consumeables.cards) do
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = '0.4',
						func = function()
							if to_big(G.consumeables.config.card_limit) > to_big(#G.consumeables.cards) then
								play_sound('timpani')
								SMODS.add_card({set = 'Tarot',key = 'c_devil'})
								card:juice_up(0.3,0.5)

							end
							return true

						end


					}))

				end


			end
			end
	end,
	check_for_unlock = function(self,args)

		return next(SMODS.find_card('c_judgement')) and next(SMODS.find_card('c_devil'))

	end

}