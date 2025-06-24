blindatlas = SMODS.Atlas {
  px = 34,
  py = 34,
  key = "blindatlas",
  path = "seeratlas.png",
  atlas_table = 'ANIMATION_ATLAS',
  frames = 21,

}
oceanatlas = SMODS.Atlas {
  px = 34,
  py = 34,
  key = "oceanatlas",
  path = "oceanatlas.png",
  atlas_table = "ANIMATION_ATLAS",
  frames = 21,
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
  boss_colour = HEX('400707'),
  boss = { min = 2, max = 10 },

  calculate = function(self, blind, context)
    if context.individual and (context.cardarea == G.play or context.cardarea == 'unscored') then
      context.other_card:juice_up(0.3, 1)
      context.other_card:set_ability("m_astropulvis_cursed")
    end
  end
}

SMODS.Blind {
  key = "the_ocean",
  loc_txt = {
    name = "The Ocean",
    text = { "Strips away attributes from played cards." },
  },
  atlas = oceanatlas.key,
  pos = { x = 0, y = 0 },
  discovered = true,
  boss_colour = HEX('3e59ab'),
  boss = { min = 4, max = 10 },
  calculate = function(self, blind, context)
    if context.individual and (context.cardarea == G.play or context.cardarea == "unscored") then
      context.other_card:juice_up(0.3, 1)
      context.other_card:set_ability(nil)
      context.other_card:set_edition(nil)
      context.other_card:set_seal(nil)
    end
  end

}
