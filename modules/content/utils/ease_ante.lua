
local ease_ante_ref = ease_ante
function ease_ante(mod)
  SMODS.calculate_context({ante_change = true})
  CHAR.FUNC.ease_risk(mod * 10)
  return ease_ante_ref(mod)
end