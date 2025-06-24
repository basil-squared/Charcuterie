local smods_has_no_suit_ref = SMODS.has_no_suit
local smods_get_id_ref = SMODS.get_id
function SMODS.has_no_suit(card)
	if G.GAME.blind then
		if G.GAME.blind.config.blind.key == "bl_astropulvis_the_dip" then
			return true
		end
	end
	return smods_has_no_suit_ref(card)
end -- Function hooking is very handy to get something to do what you want.

SMODS.Gradient({
	key = "purified",
	colours = { HEX("98f8fa"), HEX("7affd3"), HEX("7aff93") },
	cycle = 5,
})

function SMODS.get_id(self)
	if next(SMODS.find_card("j_astropulvis_estrogen")) and smods_get_id_ref(self) == 11 or 12 or 13 then
		return 12 -- 11 is Jack, 12 is Queen, 13 is King and 14 is Ace.
	else
		return smods_get_id_ref(self)
	end
end

-- Globals dont require declaration? what the fuck?
