local gnb = get_new_boss
function get_new_boss()
  --Fix an issue with adding bosses mid-run
  for k, v in pairs(G.P_BLINDS) do
    if not G.GAME.bosses_used[k] then
      G.GAME.bosses_used[k] = 0
    end
  end

  local bl = gnb()

---@diagnostic disable-next-line: param-type-mismatch
  local bl_key = string.sub(bl, 4)

  local tier2blinds = {
    tooth = true,
    manacle =true,
    wall = true,
    hook = true,
    arm = true,
    needle = true,
    window = true,
    head = true,

  }
  local tier3blinds = {
    wall = true,
    tooth = true,
    manacle = true,
    hook = true,
    arm = true,
    needle = true,
    window = true,
    head = true,
  }
  if #CHAR.G.BLIND_REPEAT_QUEUE > 0 and CHAR.G.LOCKED_BOSS then
    print("Blind repeat queue not empty! intercepting...")
    for k,v in pairs(CHAR.G.BLIND_REPEAT_QUEUE) do
      if type(CHAR.G.BLIND_REPEAT_QUEUE[k]) == 'number' and CHAR.G.BLIND_REPEAT_QUEUE[k] >= 1 then
        CHAR.G.BLIND_REPEAT_QUEUE[k] = CHAR.G.BLIND_REPEAT_QUEUE[k] - 1
        print("Decremented blind queue number by one, returning locked boss...")
        return CHAR.G.LOCKED_BOSS
      else
        CHAR.G.BLIND_REPEAT_QUEUE[k] = nil
      end
    end
  else
    CHAR.G.LOCKED_BOSS = nil
  end
  if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante >= G.GAME.win_ante  then
    if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante >= G.GAME.win_ante * 2 then
      if tier3blinds[bl_key] then
        return "bl_charcuterie_bigger" .. bl_key
      end
    end
    if tier2blinds[bl_key] then
      return "bl_charcuterie_big" .. bl_key
    end



  end
  return bl
end

function get_new_small()

  if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante > 8  then



    if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante > 16 then
      return 'bl_charcuterie_small_t3'
    end
    return 'bl_charcuterie_small_t2'
  end
  return 'bl_small'







end

function get_new_big()
  if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante > 8  then



    if G and G.GAME and G.GAME.selected_back.name == "b_charcuterie_hardcore" or G and G.GAME and G.GAME.round_resets.ante > 16 then
      return 'bl_charcuterie_big_t3'
    end
    return 'bl_charcuterie_big_t2'
  end
  return 'bl_big'
end