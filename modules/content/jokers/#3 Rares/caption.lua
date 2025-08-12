SMODS.Joker {
  key = "caption",
  atlas = CHAR.G.jokeratlas.key,
  pos = { x = 38, y = 0 },
  config = { extra = { xmult_increm = 0.1, totalxmult = 1.0, jok_slot = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_increm, card.ability.extra.totalxmult } }
  end,
  rarity = 3,
  cost = 7,
  calculate = function(self, card, context)
    if context.card_added
        and context.card.ability.set == 'Joker' then
      if G.jokers.config.card_limit > 5 then
        card.ability.extra.totalxmult = card.ability.extra.totalxmult +
            (card.ability.extra.xmult_increm * (G.jokers.config.card_limit - card.ability.extra.jok_slot))
      else
        card.ability.extra.totalxmult = 1
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.totalxmult
      }
    end
  end
}

