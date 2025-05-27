SMODS.Tag {
	key = "meltytag",
	atlas = CHAR.G.tagatlas.key,
	pos = {x=0,y=0},
	min_ante = 2,
	config = { type = "store_joker_modify" },
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil

			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ charcuterie_melty = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,

}