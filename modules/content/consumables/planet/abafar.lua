SMODS.Consumable {
	key = 'abafar',
	set = "Planet",
	atlas = CHAR.G.planetatlas.key,
	pos = {x=1,y=0},
	config = {hand_type = 'charcuterie_graystraight', softlock = true},
	use = function(self,card,area,copier)
		CHAR.FUNC.level_up_hand(card,'charcuterie_graystraight',false,1)
	end,
	loc_vars = function(self,info_queue,card)
		-- Snatched this code from the Spectrum Framework mod. check them out at https://github.com/wingedcatgirl/SpectrumFramework !
		local hand = card.ability.hand_type
		if G.GAME and G.GAME.hands and G.GAME.hands[hand] then
			return { vars = {

				G.GAME.hands[hand].level,
				localize(hand, "poker_hands"),
				G.GAME.hands[hand].l_mult,
				G.GAME.hands[hand].l_chips,
				colours = {
					(
							to_big(G.GAME.hands[hand].level) == to_big(1) and G.C.UI.TEXT_DARK
									or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands[hand].level))]
					),
				},
			},

			}
		end

	end,
	can_use =  function(self,card)
		return true
	end
}

