SMODS.Joker {
	key = 'search_engine',
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=70,y=0},
	config = {extra = {chips = 0, chip_gain = 30,}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chip_gain,card.ability.extra.chips}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind or context.before then
			local _suits = CHAR.FUNC.check_suits_deck()

			card.ability.extra.chips = 0
			for k, _ in pairs(_suits) do
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			end

		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end
}