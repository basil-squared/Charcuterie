function CHAR.FUNC.ease_risk(mod, instant)
  local Risk = G.GAME.Risk or 0
  local risk_UI = assert(G.HUD:get_UIE_by_ID("charcuterie_risk_UI_shit")) -- assert this because if this returns nil, something has gone terribly wrong.


  local function _mod(mod)
    -- Use the LOCAL Risk variable for calculations
    if (Risk + (mod / 100)) > 1 then -- Changed to use local Risk
      Risk = 1
      Percentage_Risk = 100
      Risk_manip_table.disp_risk = Percentage_Risk .. "%"
      Risk_manip_table.risk = Risk -- Use local Risk here
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
      G.GAME.Risk = Risk -- Update global Risk AFTER local calculations
      return
    end
    if (G.GAME.RISK_LOCK or false) == true then -- Changed to use local Risk
      Risk = 1
      Percentage_Risk = 100
      Risk_manip_table.disp_risk = Percentage_Risk .. "%"
      Risk_manip_table.risk = Risk -- Use local Risk here
      risk_UI.config.object:update()
      G.HUD:recalculate()
      attention_text({
        text = "LOCKED TO MAX",
        scale = 0.6,
        hold = 0.7,
        cover = risk_UI.parent,
        cover_colour = G.C.RED,
        align = "cm",
      })
      play_sound("charcuterie_bad_sound")
      G.GAME.Risk = Risk -- Update global Risk AFTER local calculations
      return
    end

    if (Risk + (mod / 100)) < 0 then -- Changed to use local Risk
      Risk = 0
      Percentage_Risk = 0
      Risk_manip_table.disp_risk = Percentage_Risk .. "%"
      Risk_manip_table.risk = Risk -- Use local Risk here
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
      G.GAME.Risk = Risk -- Update global Risk AFTER local calculations
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
    Risk = Risk + (mod / 100) -- Update local Risk
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
    G.GAME.Risk = Risk -- Update global Risk AFTER local calculations
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