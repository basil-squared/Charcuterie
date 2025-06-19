local start_run_ref = Game.start_run
---@diagnostic disable-next-line: duplicate-set-field
function Game:start_run(args)
  args = args or {}
  G.GAME.Risk = 0.00
  G.GAME.in_run = true
  G.GAME.RISK_LOCK = false
  G.GAME.RISK_RATE = 1
  Risk_manip_table.disp_risk = 0 .. "%"
  Risk_manip_table.risk = 0
  return start_run_ref(self, args)
end