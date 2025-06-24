local smods_has_no_suit_ref = SMODS.has_no_suit
local smods_get_id_ref = SMODS.get_id
local start_run_ref = Game.start_run
local ease_ante_ref = ease_ante

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
SMODS.Gradient({
	key = "unstable",
	colours = { HEX("1aff00"), HEX("7bdb70"), HEX("064000") },
	cycle = 5,
})
SMODS.Gradient({
	key = "galactical",
	colours = {HEX("7c2de3"),HEX("4f068f"),HEX("834dbd"),HEX("b066ff")},
	cycle = 5,
})
function SMODS.get_id(self)
	local ofr = smods_get_id_ref(self)
	if next(SMODS.find_card("j_astropulvis_estrogen")) and ofr == 11 or ofr == 12 or ofr == 13 then
		return 12 -- 11 is Jack, 12 is Queen, 13 is King and 14 is Ace.
	else
		return smods_get_id_ref(self)
	end
end
function Game:start_run(args)
	args = args or {}
	G.GAME.Risk = 0.00
	Risk_manip_table.disp_risk = 0 .. "%"
	Risk_manip_table.risk = 0
	return start_run_ref(self,args)
end
-- Globals dont require declaration? what the fuck?
--
function ASPL.FUNC.ease_risk(mod, instant)
	local Risk = G.GAME.Risk or 0
	local risk_UI = G.HUD:get_UIE_by_ID("astropulvis_risk_UI_shit")

	local function _mod(mod)
		-- Use the LOCAL Risk variable for calculations
		if (Risk + (mod / 100)) > 1 then  -- Changed to use local Risk
			Risk = 1
			Percentage_Risk = 100
			Risk_manip_table.disp_risk = Percentage_Risk .. "%"
			Risk_manip_table.risk = Risk  -- Use local Risk here
			risk_UI.config.object:update()
			G.HUD:recalculate()
			attention_text({
				text = "Max Risk!!",
				scale = 0.6,
				hold = 0.7,
				cover = risk_UI.parent,
				cover_colour = G.C.RED,
				align = "cm",
			})
			play_sound("chips2")
			G.GAME.Risk = Risk  -- Update global Risk AFTER local calculations
			return
		end

		if (Risk + (mod / 100)) < 0 then  -- Changed to use local Risk
			Risk = 0
			Percentage_Risk = 0
			Risk_manip_table.disp_risk = Percentage_Risk .. "%"
			Risk_manip_table.risk = Risk  -- Use local Risk here
			risk_UI.config.object:update()
			G.HUD:recalculate()
			attention_text({
				text = "Min Risk",
				scale = 0.6,
				hold = 0.7,
				cover = risk_UI.parent,
				cover_colour = G.C.GREEN,
				align = "cm",
			})
			play_sound("chips2")
			G.GAME.Risk = Risk  -- Update global Risk AFTER local calculations
			return
		end

		-- Normal case (no min/max reached)
		mod = mod or 0
		local text = "+"
		local col = G.C.RED
		if mod < 0 then
			text = "-"
			col = G.C.GREEN
		end
		Risk = Risk + (mod / 100)  -- Update local Risk
		Percentage_Risk = Risk * 100
		Risk_manip_table.disp_risk = Percentage_Risk .. "%"
		Risk_manip_table.risk = Risk
		risk_UI.config.object:update()
		G.HUD:recalculate()
		attention_text({
			text = text .. tostring(math.abs(mod)) .. "%",
			scale = 0.6,
			hold = 0.7,
			cover = risk_UI.parent,
			cover_colour = col,
			align = "cm",
		})
		G.GAME.Risk = Risk  -- Update global Risk AFTER local calculations
		play_sound("chips2")
	end

	if instant then
		_mod(mod)
	else
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				_mod(mod)
				return true
			end
		}))
	end
end

function get_key_for_value(t, value)
	for k, v in pairs(t) do
		if v == value then
			return k
		end
	end
	return nil
end
function ASPL.FUNC.fetch_most_played()
	local played_tab = {}
	local most_played = {}
	local max_val = -math.huge
	for k, v in pairs(G.GAME.hands) do
		played_tab[k] = v.played
	end -- This fetches a table that should be {"HAND" = INTEGER_THAT_REPRESENTS_AMNT_PLAYED}
	for _, v in pairs(played_tab) do
		if v > max_val then
			max_val = v
		end
	end


	for k, v in pairs(played_tab) do
		if v == max_val then


			most_played[k] = v
		end
	end
	mp_raw = get_key_for_value(most_played,max_val)

	return mp_raw
end


function ASPL.FUNC.negative_event_proc(riskv)
	if riskv >= pseudorandom("wagabagabobo") then
		return false

	else
		return true
	end
end

function ASPL.FUNC.check_enhancement_deck(enhancement)
	local tablerer={}
	for i=1,#G.playing_cards do
		if SMODS.has_enhancement(G.playing_cards[i],enhancement) then
			table.insert(tablerer,G.playing_cards[i])
		end
	end
	return #tablerer
end

function ease_ante(mod)
	ASPL.FUNC.ease_risk(mod * 10)
	return ease_ante_ref(mod)
end