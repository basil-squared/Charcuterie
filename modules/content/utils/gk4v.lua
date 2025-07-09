
--[[
  ooh look at mee go
  making a function that shouldve existed in the FIRST PLACE
  FUCK YOU FUCK YOU FUCK YOU FUCK YOU DIE DIE DIE
  im going to bed
 ]]
function get_key_for_value(t, value)
  for k, v in pairs(t) do
    if v == value then
      return k
    end
  end
  return nil
end