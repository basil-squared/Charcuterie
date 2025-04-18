local enhancementatlas = SMODS.Atlas {
  key = "enhancement_atlas",
  path = "enhancementatlas.png",
  px = 71,
  py = 95,
}




SMODS.Enhancement {
  key = "galactical",
  loc_txt = {
    name = "Galactical Card",
    text = { "{C:green}#1# in #2# chance{} to upgrade", "the hand this card is played in." },
  },
  config = { extra = { odds = 20 } },
  atlas = enhancementatlas.key,
  pos = { x = 0, y = 0 },
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,


  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      if pseudorandom('galactical') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return { level_up = 1, message = "Upgrade!" }
      end
    end
  end


}

SMODS.Enhancement {
  key = "cursed",
  loc_txt = {
    name = "Cursed Card",
    text = { "After being played 3 times, {C:red}Debuffs itself.{}", "{s:0.7,C:inactive}#1# plays left.{}" }
  },
  config = { extra = { ttk = 3 } },
  atlas = enhancementatlas.key,
  pos = { x = 1, y = 0 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.ttk } }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      -- alright, so i need to figure out how to debuff the card after 3 turns.
      if card.ability.extra.ttk > 0 then
        card.ability.extra.ttk = card.ability.extra.ttk - 1
        return { message = card.ability.extra.ttk .. "..." }
      else
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.2,
          blockable = true,
          blocking = false,
          func = function()
            SMODS.debuff_card(card, true, card)
            return true
          end
        }))
        return { message = "Cursed!" }
      end
    end
  end

}
