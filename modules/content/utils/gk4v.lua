function get_key_for_value(t, value)
  for k, v in pairs(t) do
    if v == value then
      return k
    end
  end
  return nil
end