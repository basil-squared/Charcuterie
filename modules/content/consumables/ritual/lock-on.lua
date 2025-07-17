SMODS.Consumable {
	key = 'lockon',
	atlas = CHAR.G.ritualatlas.key,
	pos = {x=2,y=2},
	set = 'ritual',
	config = {extra = {lock_num = 3}},
	loc_vars = function(self,info_queue,card)
		return {
			vars = {card.ability.extra.lock_num}
		}
	end,
	use = function(self,card,area,copier)

		CHAR.G.BLIND_REPEAT_QUEUE[#CHAR.G.BLIND_REPEAT_QUEUE + 1 ] = card.ability.extra.lock_num
		if not CHAR.G.LOCKED_BOSS  then
			CHAR.G.LOCKED_BOSS =  G.GAME.round_resets.blind_choices.Boss
		end

	end,
	can_use = function(self,card)
		return true
	end
}