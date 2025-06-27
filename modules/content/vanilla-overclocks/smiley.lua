SMODS.Joker:take_ownership('smiley',
		{
			loc_vars = function(self,info_queue,card)
				info_queue[#info_queue+1] = {set = "Other",key = "char_txt_ochint_smiley"}
			end,

			calculate = function(self, card, context)
				if context.remove_playing_cards and not context.blueprint then
					for _, removed_card in ipairs(context.removed) do
						if removed_card:is_face() then

							card.ability.ext_ovr.faces_destroyed = card.ability.ext_ovr.faces_destroyed + 1
						end

					end
					if card.ability.ext_ovr.faces_destroyed >= 10 then
						CHAR.FUNC.overclock_proc({card =card,key =card.ability.ext_ovr.overclock_counterpart})





					end


				end

			end,
			add_to_deck = function(self,card,from_debuff)
				card.ability.ext_ovr = {}
				card.ability.ext_ovr.faces_destroyed = 0
				card.ability.ext_ovr.overclock_counterpart = "j_charcuterie_ferocious_grin"
			end


		},
		true


)