blindatlas = SMODS.Atlas {
  px = 34,
  py = 34,
  key = "blindatlas",
  path = "seeratlas.png",
  atlas_table = 'ANIMATION_ATLAS',
  frames = 8,

}


SMODS.Blind {
  key = "the_seer",
  loc_txt = {
    name = "The Seer",
    text = { "Applies the Curse enhancement to every card played." },
  },
  atlas = blindatlas.key,
  pos = { x = 0, y = 0 },
  discovered = true,
  boss_colour = HEX('400707')
}
