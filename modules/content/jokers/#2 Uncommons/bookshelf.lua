SMODS.Joker {
	key = 'bookshelf',
	atlas = CHAR.G.jokeratlas2.key,
	config = {extra = { used_tarots = {}}},
	pos = {x=7,y=0},
	rarity = 2,
	calculate = function(self,card,context) -- This hardly works, but dude i could hardly care anymore. just. report any crashes
		if context.using_consumeable then
			if context.consumeable.ablility.set == 'Tarot' then
				card.ability.extra.used_tarots[#card.ability.extra.used_tarots + 1] = context.consumeable.config.center.key
			end
			if context.consumeable.ability.set == 'ritual' then

				if #card.ability.extra.used_tarots >= #G.P_CENTER_POOLS.Tarot then
					return {
						message = localize(k_nope_ex),
						func = function()
							SMODS.destroy_cards(card)
						end
					}
				end
				local rand_tarot = pseudorandom_element(G.P_CENTER_POOLS.Tarot, pseudoseed('BLAHBLAHLAFGJEIHJFOAHFUHBNQW{F'))
				local function repeat_until_hit()
					for k,v in pairs(card.ability.extra.used_tarots) do
						if rand_tarot.key == card.ability.extra.used_tarots[k] then
							rand_tarot = pseudorandom_element(G.P_CENTER_POOLS.Tarot, pseudoseed('BLAHBLAHLAFGJEIHJFOAHFUHBNQW{F'))
							repeat_until_hit()

						end
					end
				end
				repeat_until_hit()
				print(card.ability.extra.used_tarots)
				SMODS.add_card({set = 'Tarot',key = rand_tarot.key})

			end
			end

	end
}