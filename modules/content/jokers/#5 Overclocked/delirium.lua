---@param jokers table
---@param card Card
---@return Card?
--- function thats literally used for just this joker because recursion sucks
local function delirium_proc(jokers, card)
	local sel_card = pseudorandom_element(jokers,pseudoseed('gkewrirrgw'))
	if sel_card == card then
		sel_card = delirium_proc(jokers,card)
	end
	return sel_card
	

end

SMODS.Joker {
	key = 'delirium',
	atlas = CHAR.G.overclockedatlas.key,
	pos = {x = 3,y=0},
	config = {extra = {curr_xm = 1,xm_scale = 1,}},
	unlocked = false,
	rarity = 'charcuterie_overclocked',
	check_for_unlock = function(self,...)
		if G.GAME.Overclock_Table and G.GAME.Overclock_Table['j_charcuterie_delirium'] then
			return true

		end
		return false

	end,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue +1 ] = {set='Other',key='char_txt_oc'}
		return { vars = { card.ability.extra.xm_scale,card.ability.extra.curr_xm}}
	end,
	
	calculate = function(self,card,context)
		if context.setting_blind and not context.blueprint and not context.blind.boss and #G.jokers.cards >= 2 then
			local sel_card = delirium_proc(G.jokers.cards, card)
			if sel_card  then
				SMODS.destroy_cards(sel_card)
				card.ability.extra.curr_xm = card.ability.extra.curr_xm + card.ability.extra.xm_scale
				return {
					message = localize('k_upgrade_ex')
				}
			end
		end
		if context.joker_main then
			return {
				xchips = card.ability.extra.curr_xm,
				xmult  = card.ability.extra.curr_xm
			}
		end
	end
}