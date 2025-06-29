
SMODS.Joker {
	key = 'bunker',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x=24,y=0},
	config = {extra={xchip_scale = 0.2,curr_xchip = 1, current_suit = ""}},
	rarity = "charcuterie_overclocked",
	loc_vars = function(self,info_queue,card)
		local suit = CHAR.G.current_bunker_suit
		info_queue[#info_queue+1] = {set="Other",key="char_txt_oc"}
		return {vars = {card.ability.extra.xchip_scale,
		                localize(suit,'suits_singular'),
		                ((card.ability.old_extra  or {}).chips or 0),
		                card.ability.extra.curr_xchip,

						colours = {
							G.C.SUITS[suit]
						}}}
	end,
	unlocked = false,
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_bunker'] then
			return true

		end
		return false

	end,
	calculate = function(self,card,context)
		if context.discard and
				not context.blueprint and
				not context.other_card.debuff and
				context.other_card:is_suit(CHAR.G.current_bunker_suit) then
			card.ability.extra.curr_xchip = card.ability.extra.curr_xchip + card.ability.extra.xchip_scale
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS
			}

		end
		if context.joker_main then
			return {
				chips = card.ability.old_extra and card.ability.old_extra.chips,
				xchips = card.ability.extra.curr_xchip
			}
		end
	end


}

function CHAR.FUNC.reset_bunker_suit()
	local _suits = CHAR.FUNC.check_suits_deck()
	for k,v in pairs(_suits) do
		_suits[k] = _suits[k] + pseudorandom("ehfouiwhouwiefhouehfou")
	end
	local picked_suit = pseudorandom_element(_suits,pseudoseed("pfjpjfio9wejfpjaurgbhtphivg" .. os.time()))


	CHAR.G.current_bunker_suit = get_key_for_value(_suits,picked_suit)
end


