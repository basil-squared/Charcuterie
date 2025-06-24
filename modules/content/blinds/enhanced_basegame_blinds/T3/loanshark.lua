SMODS.Blind {
	key = "biggertooth",
	atlas = CHAR.G.blindatlas.key,
	boss_colour = HEX("8c4a08"),
	boss = {min = 16, max = 999},
	pos = {x=0,y=11},
	mult=5,
	config = {extra = {has_activated = false}},
	calculate = function(self,blind,context)
		if context.setting_blind then
			G.GAME.blind.config.blind.config.extra.has_activated = false
		end
		if context.individual and context.cardarea == G.play then
			ease_dollars(-2)

			end


		if G.GAME.dollars < 0 and not G.GAME.blind.config.blind.config.extra.has_activated then
			play_sound('charcuterie_bad_sound')
			G.GAME.blind.chips =  G.GAME.blind.chips * G.GAME.blind.chips
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.GAME.blind.config.blind.config.extra.has_activated = true
			SMODS.juice_up_blind()


		end
		end

}