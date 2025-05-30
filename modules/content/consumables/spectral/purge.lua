SMODS.Consumable {
	key = 'purge',
	set = 'Spectral',
	atlas = CHAR.G.tarotatlas.key,
	pos = { x = 3, y = 0 },
	config = { max_highlighted = 1 },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_charcuterie_bleached

		return { vars = { card.ability.max_highlighted } }
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()

				local bleach_card = G.hand.highlighted[1]
				bleach_card:set_edition("e_charcuterie_bleached", true)
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
	end,

}