SMODS.Joker {
	key = 'magic_bullet',
	rarity = 2,
	cost = 5,
	atlas = CHAR.G.jokeratlas.key,
	pos = {x = 68,y=0},
	config = {extra = {start_mult = 3, tarot_decrem = 0.05, spectral_decrem = 0.5,currmult = 3}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.start_mult,card.ability.extra.tarot_decrem,card.ability.extra.spectral_decrem,card.ability.extra.currmult}}
	end,
	calculate = function(self,card,context)
		if context.using_consumeable then
			if card.ability.extra.currmult < 1.01 then
				local victim = card
				if not victim then
					return
				end -- Safety check

				victim.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1

				-- Store reference in local variable for closure
				local dissolve_target = victim
				SMODS.calculate_effect({message = "Broken!"},card)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 2.5,
					blockable = false,
					func = function()
						if dissolve_target and dissolve_target.start_dissolve then
							dissolve_target:start_dissolve()
						end
						G.GAME.joker_buffer = 0
						return true
					end,
				}))
			end
			if context.consumeable.ability.set == 'Tarot' then
				card.ability.extra.currmult = card.ability.extra.currmult - card.ability.extra.tarot_decrem
				return {
					message = "-X" .. card.ability.extra.tarot_decrem .. " Mult",
					colour = G.C.RED
				}
			end
			if context.consumeable.ability.set == 'Spectral' then
				card.ability.extra.currmult = card.ability.extra.currmult - card.ability.extra.spectral_decrem
				return {
					message = "-X" .. card.ability.extra.spectral_decrem .. " Mult",
					colour = G.C.RED
				}

			end
		end
		if context.joker_main then
			if card.ability.extra.currmult < 1.01 then
				local victim = card
				if not victim then
					return
				end -- Safety check

				victim.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1

				-- Store reference in local variable for closure
				local dissolve_target = victim
				SMODS.calculate_effect({message = "Broken!"},card)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 2.5,
					blockable = false,
					func = function()
						if dissolve_target and dissolve_target.start_dissolve then
							dissolve_target:start_dissolve()
						end
						G.GAME.joker_buffer = 0
						return true
					end,
				}))
			end
			return {
				xmult = card.ability.extra.currmult
			}
		end

	end
}