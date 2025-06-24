local curr_enhancement
SMODS.Seal {
	key = "brilliant",
	badge_colour = HEX('f5d046'),
	atlas = ASPL.G.sealatlas.key,
	pos = {x=2,y=0},
	config = {extra = {xchips = 1.5}},
	loc_vars = function(self,info_queue,card) return {vars = {self.config.extra.xchips}}  end,
	calculate = function(self,card,context)
		if not curr_enhancement then
			curr_enhancement = card.center_key
		end
		if context.main_scoring and context.cardarea == G.play then

			if card.center_key then
				return {
					xchips = self.config.extra.xchips

				}


			end

		end
	end
}