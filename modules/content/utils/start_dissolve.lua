local sd_ref = Card.start_dissolve

---@diagnostic disable-next-line: duplicate-set-field
function Card.start_dissolve(self,dissolve_colours,silent,dissolve_time_fac,no_juice)
  if G and G.GAME and G.GAME.in_run then
    SMODS.calculate_context({card_killed = true})
  end
  
  return sd_ref(self,dissolve_colours,silent,dissolve_time_fac,no_juice)
end