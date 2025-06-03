SMODS.Blind {
	key = "biggerneedle",
	boss = {min = 1600000, max =16},
	boss_colour = HEX("6a9068"),
	atlas = CHAR.G.blindatlas.key,
	pos = {x=0,y=19},
	mult = 6,
	set_blind = function(self)
		ease_hands_played(-G.GAME.current_round.hands_left + 1, nil, true)
		ease_discard(-G.GAME.current_round.discards_left, nil, true)
	end
}