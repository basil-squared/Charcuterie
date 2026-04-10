SMODS.Edition {
	key = "etched",
	shader = "etched",
	in_shop = true,
	weight = 8,
	extra_cost = 4,
	badge_colour = HEX("4F6367"),
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	calculate = function(self, card, context)
		if context.destroy_card and not context.blueprint then
			-- Prevent destruction unless the card was explicitly selected
			-- e.g. via hanged man, sigil, etc. where the player chose it
			if not context.explicit_destroy then
				return { remove = true }
			end
		end
	end,
}
