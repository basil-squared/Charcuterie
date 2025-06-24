SMODS.Joker:take_ownership('smiley',
		{


			calculate = function(self, card, context)
				if context.remove_playing_cards and not context.blueprint then
					for _, removed_card in ipairs(context.removed) do
						if removed_card:is_face() then

							card.ability.ext_ovr.faces_destroyed = card.ability.ext_ovr.faces_destroyed + 1
						end

					end
					if card.ability.ext_ovr.faces_destroyed >= 10 then
						CHAR.FUNC.overclock_proc(card,'j_charcuterie_ferocious_grin')





					end


				end

			end,
			add_to_deck = function(self,card,from_debuff)
				card.ability.ext_ovr = {}
				card.ability.ext_ovr.faces_destroyed = 0
			end


		},
		true


)