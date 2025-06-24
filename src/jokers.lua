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
    if context.joker_main then
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
    name = "U.F.O",
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
  key = "juxt",
  loc_txt = {
    name = "Juxtaposition",
    text = { "Remove {C:dark_edition}Negative{} from all Jokers you have,",
      "{C:attention}+1{} Joker Slot every time {C:dark_edition}Negative{} is removed.",
      "{S:0.6,C:inactive}Currently +#1# Joker Slots.{}" },
  },
  atlas = jokeratlas.key,
  blueprint_compat = false,
  config = {
    extra = { jokplus = 0 }
  },
  pos = { x = 9, y = 0 },
  soul_pos = { x = 10, y = 0 },
  rarity = 4,
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.jokplus }
    }
  end,

  calculate = function(self, card, context)
    if context.card_added and context.card.ability.set == "Joker" and context.card.edition and context.card.edition.negative then
      context.card:set_edition(nil)
      card.ability.extra.jokplus = card.ability.extra.jokplus + 1
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokplus
  end,
  add_to_deck = function(self, card, from_debuff)
    jokers = G.jokers.cards
    for i = 1, #jokers do
      if jokers[i].edition and jokers[i].edition == jokers[i].edition.negative then
        jokers[i]:set_edition(nil)
        card.ability.extra.jokplus = card.ability.extra.jokplus + 1
      end
    end
  end


}


SMODS.Joker {
  key = "virtuous",
  atlas = jokeratlas.key,
  pos = { x = 11, y = 0 },
  loc_txt = {
    name = "Virutous Joker",
    text = { "Awards {C:attention}$1{} per {C:astropulvis_purified}Purified{} card",
      "in your full deck.",
      "{S:0.7,C:inactive}(currently{}{S:0.7,C:attention}$#1#{}{S:0.7,C;inactive}.)" }
  },

  rarity = 3,
  cost = 5,
  calculate = function(self, card, context)
  end
}

SMODS.Joker {
  key = "estrogen",
  atlas = jokeratlas.key,
  pos = { x = 11, y = 0 },
  blueprint_compat = false,
  loc_txt = {
    name = "Estrogen",
    text = { "All face cards are considered {C:attention}Queens{}." }
  },

  rarity = 2,
  cost = 5
}

SMODS.Joker {
  atlas = jokeratlas.key,
  pos = {x=0,y=0},
  key = "haley_comet",
  config = {extra = {to_generation = 5}},
  loc_txt = {
    name = "Haley's Comet",
    text = {"For every {C:attention}5{} Hands played,","generate 3 {C:dark_edition}Negative{} {C:planet}Planet Cards{} for your", "{C:attention}most played{} hand.", "{S:0.7,C:inactive}(currently #1#){}"}

  },

  calculate = function(self,card,context)
    if context.joker_main then 
      if self.config.extra.to_generation ==  0 then
        -- Spawn logic here
        return {
          message = "Reset"
        }
      else
        self.config.extra.to_generation = self.config.extra.to_generation -1
        return { 
          message = tostring(self.config.extra.to_generation) .. " Remaining"
        }
      end
    end
  end
  
}