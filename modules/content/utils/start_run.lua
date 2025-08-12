local start_run_ref = Game.start_run
---@diagnostic disable-next-line: duplicate-set-field
function Game:start_run(args)
  args = args or {}
  G.GAME.Risk = 0.00
  CHAR.G.Overclock_Table = {}
  G.GAME.in_run = true
  G.GAME.RISK_LOCK = false
  G.GAME.RISK_RATE = 1
  CHAR.G.current_bunker_suit = 'Diamonds'
  CHAR.G.BLIND_REPEAT_QUEUE = {}
  CHAR.G.CURR_BOSS = nil
  if not CHAR.G.LOCKED_BOSS then
    CHAR.G.LOCKED_BOSS = nil
  end

  Risk_manip_table.disp_risk = 0 .. "%"
  Risk_manip_table.risk = 0
  -- WAITER! WAITER! MORE Game:start_run() hooks!
  return start_run_ref(self, args)
end