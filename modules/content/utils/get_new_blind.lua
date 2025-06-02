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

  }
  local tier3blinds = {
    wall = true,
    tooth = true,
    manacle = true,
    hook = true,
    arm = true,
    needle = true,
  }
  if G and G.GAME and G.GAME.round_resets.ante >= 8  then
    if G and G.GAME and G.GAME.round_resets.ante >= 16 then
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

  if G and G.GAME and G.GAME.round_resets.ante > 8  then



    if G and G.GAME and G.GAME.round_resets.ante > 16 then
      return 'bl_charcuterie_small_t3'
    end
    return 'bl_charcuterie_small_t2'
  end
  return 'bl_small'







end

function get_new_big()
  if G and G.GAME and G.GAME.round_resets.ante > 8  then



    if G and G.GAME and G.GAME.round_resets.ante > 16 then
      return 'bl_charcuterie_big_t3'
    end
    return 'bl_charcuterie_big_t2'
  end
  return 'bl_big'
end