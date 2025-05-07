SMODS.Consumable {
	key = "ritual_chippedcoin",
	set = "ritual",
	loc_txt = {
		name  = "Chipped Coin",
		text = {"{C:green}#1#%{} chance to {C:attention}double{} money.", "{C:red}#2#%{} Chance to backfire and set money to {C:money}$0{} instead."}

	},
	atlas = ASPL.G.ritualatlas.key,
	pos = {x=6,y=0},
	config = {extra = {pos_proc = tostring((1 - Risk) * 100), neg_proc = tostring(Risk * 100)}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.pos_proc, card.ability.extra.neg_proc}}
	end,
}