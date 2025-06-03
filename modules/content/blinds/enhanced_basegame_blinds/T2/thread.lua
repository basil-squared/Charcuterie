SMODS.Blind {
	key = "bigneedle",
	boss = {min = 800000, max =16},
	boss_colour = HEX("6a9068"),
	atlas = CHAR.G.blindatlas.key,
	pos = {x=0,y=18},
	mult = 3,
	set_blind = function(self)
		ease_hands_played(-G.GAME.current_round.hands_left + 1, nil, true)
	end
}