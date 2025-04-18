local jokeratlas = SMODS.Atlas {
  key = "joker_atlas",
  path = "joker_atlas.png",
  px = 71,
  py = 95,
}






SMODS.Joker {
  key = "crazy8",
  loc_txt = {
    name = "Crazy 8",
    text = { "For every {C:attention}8{} Played,", "grants {C:white,X:mult}x#1#{} Mult." }


  },
  config = { extra = { xmult = 4, chips = 88 } },
  rarity = 4,
  atlas = jokeratlas.key,
  pos = { x = 0, y = 0 },
  cost = 8,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 8 then
        return {
          message = localize { type = 'variable', key = 'x_mult', vars = { card.ability.extra.mult } },
          xmult = card.ability.extra.xmult,
          chips = card.ability.extra.chips,
          card = context.other_card
        }
      end
    end
  end,


}

SMODS.Joker {
  key = "jonker",
  loc_txt = {
    name = "The Jonker",
    text = { "Why so Serious?" }
  },
  config = { extra = { xmult = 0, chips = -100 } },
  rarity = 1,
  atlas = jokeratlas.key,
  pos = { x = 1, y = 0 },
  cost = 0,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        chips = card.ability.extra.chips
      }
    end
  end


}

SMODS.Joker {
  key = "the_j",
  loc_txt = {
    name = "The J",
    text = { "For every joker, gain {C:mult}x#1#{} Mult." },
  },
  config = { extra = { xmult = 1.5 } },
  rarity = 3,
  atlas = jokeratlas.key,
  pos = { x = 2, y = 0 },
  cost = 5,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.post_trigger then
      return {
        message = "THE J. ",
        xmult = (card.ability.extra.xmult * #G.jokers.cards)
      }
    end
  end




}
SMODS.Joker {
  key = "alien_joker",
  loc_txt = {
    name = "Alien Joker",
    text = { "Turns any face card played into a {C:purple}Galactical{} Card. " }
  },
  rarity = 3,
  atlas = jokeratlas.key,
  pos = { x = 6, y = 0 },
  cost = 5,
  discovered = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_face() then
        context.other_card:juice_up(0.3, 3)
        context.other_card:set_ability("m_astropulvis_galactical")
        return {
          message = "Abducted!"
        }
      end
    end
  end
}
-- Thanks to @gelopsys on discord for the art and code for this joker.
SMODS.Joker {
  loc_txt = {
    name = "Subplot",
    text = {
      "If a single {C:attention}played card{} does",
      "not score it permanently",
      "gains {X:mult,C:white}X#1#{} Mult" }
  },
  key = "subplot",
  atlas = jokeratlas.key,
  pos = {
    x = 7,
    y = 0
  },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = false,
  config = {
    extra = { x_mult = 0.2 }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.x_mult }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == 'unscored' then
      unscored_amount = #context.full_hand - #context.scoring_hand --checks how many unscored card there are
      if unscored_amount == 1 then
        context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
        context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.x_mult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
        }
      end
    end
  end
}

SMODS.Joker {
  key = "c_t_j",
  loc_txt = {
    name = "cursed_test_joker",
    text = { "tests to make cursed cards. " }

  },
  rarity = 3,
  atlas = jokeratlas.key,
  pos = { x = 6, y = 0 },
  cost = 999,
  discovered = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      context.other_card:juice_up(0.3, 3)
      context.other_card:set_ability("m_astropulvis_cursed")
      return {
        message = "Cursed!"
      }
    end
  end
}

SMODS.Joker {
  key = "margret_joker",
  loc_txt = {
    name = "Margret Joker"
  }
}
