SMODS.Sound {
	key = "coolkid_miss",
	path = "coolkid_miss.ogg"
}
SMODS.Sound {
	key = "coolkid_hit",
	path = "coolkid_hit.ogg"
}
SMODS.Sound {
	key = "coolkid_wo_hit",
	path = "coolkid_walkspeed_hit.ogg"
}
SMODS.Sound {
	key = "mafioso_summon",
	path = "soldiers.wav"
}

SMODS.Sound {
	key = "melty_sound",
	path = "e_melty.mp3"
}

SMODS.Sound {
	key = "bad_sound",
	path = "bad_sound.wav"
}
SMODS.Sound {
	key = "music_rewrite",
	path = "rewritelyr.ogg",
	pitch = 1.0,
	sync = false,
	select_music_track = function()
		if G and G.GAME and G.GAME.blind then
			return G.GAME.blind.config.blind.key == "bl_charcuterie_lucid_paradise"
		end

	end,
}
SMODS.Sound {
	key = "explosion",
	path = "explosion.wav"
}