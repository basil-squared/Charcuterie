local smods_has_no_suit_ref = SMODS.has_no_suit

function SMODS.has_no_suit(card)
	if G.GAME.blind then
		if G.GAME.blind.config.blind.key == "bl_astropulvis_the_dip" then
			return true
		end
	end
	return smods_has_no_suit_ref(card)
end

SMODS.Gradient({
	key = "purified",
	colours = { HEX("98f8fa"), HEX("7affd3"), HEX("7aff93") },
	cycle = 5,
})
