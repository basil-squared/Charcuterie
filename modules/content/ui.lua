--[[
Risk is a mechanic for charcuterie that I want to add, but problem is, I have not a clue what to start with. Oh well, here we go!


  ]]
difficulty_atlas = SMODS.Atlas({
	key = "diffatlas",
	path = "diff_atlas.png",
	px = 128,
	py = 128,
})
diff_atlas_vanilla = G.ASSET_ATLAS["charcuterie_diffatlas"]
local original_hud = create_UIBox_HUD
local original_blind_hud = create_UIBox_blind_choice
local original_blind_hud_select = create_UIBox_blind_select
-- ALSOOOOO... make globals start with uppercase letters. Good practice or whatever.
local Percentage_Risk = (G and G.GAME and G.GAME.Risk or 0) * 100
Risk_manip_table = { risk = G and G.GAME and G.GAME.Risk or 0, disp_risk = Percentage_Risk .. "%" }
--Some kind of UI element? gotta figure out how to do that.

--[[
G.UIT.R: Row assortment.
G.UIT.C: Column assortment.
G.UIT.ROOT: Root node. Every UI element needs a root node.
It's, generally speaking, good practice to alternate between rows and columns. 
--]]
--
function blind_tier_func()
	local spacing = 0.13

	local scale = 0.4
	return {
		n = G.UIT.C,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.R,
				align = "cm",
				padding = 0.05,
				minw = 2 * 2 + spacing,
				minh = 1,
				colour = G.C.DYN_UI.BOSS_MAIN,
				emboss = 0.05,
				r = 0.1

			},
		},
	}
end
function risk_menu_test_func()
	local spacing = 0.13
	local scale = 0.4
	return {
		n = G.UIT.R,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.45 * 2 + spacing,
					minh = 0.75,
					colour = G.C.DYN_UI.BOSS_MAIN,
					emboss = 0.05,
					r = 0.1,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.T,
								config = {
									text = "Risk",
									scale = 0.85 * scale,
									colour = G.C.UI.TEXT_LIGHT,
									shadow = true,
								},
							},
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.C,
								config = {
									align = "cm",
									r = 0.1,
									minw = 1.28 * 2 + spacing,
									minh = 0.6,
									colour = G.C.DYN_UI.BOSS_DARK,
									emboss = 0.05,
								},
								nodes = {
									{
										n = G.UIT.O,
										config = {
											object = DynaText({
												string = {
													{
														ref_table = Risk_manip_table,
														ref_value = "disp_risk",
													},
												},
												font = G.LANGUAGES["en-us"].font,
												colours = { G.C.RED },
												shadow = true,
												scale = 2 * 0.3,
											}),
											id = "charcuterie_risk_UI_shit",
										},
									},
								},
							},
						},
					},
				},
			},
		},
	}
end
function diff_test_func()
	local spacing = 0.13
	return {
		n = G.UIT.R,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.45 * 2 + spacing,
					minh = 0.75,
					colour = G.C.DYN_UI.BOSS_MAIN,
					emboss = 0.05,
					r = 0.1,
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
							text = "test",
							scale = 0.2,
							colour = G.C.UI.TEXT_LIGHT,
							id = "charcuterie_test_blind_txt",
						},
					},
					{
						n = G.UIT.O,
						config = {
							object = Sprite(0, 0, 0.7, 0.7, G.ASSET_ATLAS["charcuterie_diffatlas"], { x = 0, y = 0 }),
						},
					},
				},
			},
		},
	}
end

function T2_test_func()
	local spacing = 0.13
	return {
		n = G.UIT.R,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.45 + spacing,
					minh = 0.75,
					colour = G.C.DYN_UI.BOSS_MAIN,
					emboss = 0.05,
					r = 0.1,
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {

						},
					},
					{
						n = G.UIT.O,
						config = {
							object = DynaText({ string = { "Test" },
							                    font = G.LANGUAGES["en-us"].font,
							                    colours = { G.C.GREEN },
							                    shadow = true,
							                    scale = 1 * 0.3, }),
							id = "charcuterie_tier_test",
							align = "cm"
						},
					},
				},
			},
		},
	}
end

function lyr_disp_ui()
	local spacing = 0.13
	local scale = 0.4
	return {
		n = G.UIT.R,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.45 * 2 + spacing,
					minh = 0.75,
					colour = G.C.DYN_UI.BOSS_MAIN,
					emboss = 0.05,
					r = 0.1,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.T,
								config = {
									text = "IM ALREADY IN YOUR MIND",
									scale = 0.85 * scale,
									colour = G.C.UI.TEXT_LIGHT,
									shadow = true,
								},
							},
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.C,
								config = {
									align = "cm",
									r = 0.1,
									minw = 1.28 * 2 + spacing,
									minh = 0.6,
									colour = G.C.DYN_UI.BOSS_DARK,
									emboss = 0.05,
								},
								nodes = {
									{
										n = G.UIT.O,
										config = {
											object = DynaText({
												string = {
													{
														ref_table = CHAR.G.lyrics,
														ref_value = "current_lyric",
													},
												},
												font = G.LANGUAGES["en-us"].font,
												colours = { G.C.RED },
												shadow = true,
												scale = 2 * 0.3,
											}),
											id = "charcuterie_lucid_para_lyrics",
										},
									},
								},
							},
						},
					},
				},
			},
		},
	}

end
function create_UIBox_HUD()
	local contents = original_hud()
	

	table.insert(contents.nodes[1].nodes[1].nodes[5].nodes[2].nodes, risk_menu_test_func())

	return contents
end


-- A simple UIBox being created:

