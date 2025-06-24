SMODS.Joker {
  key = "aura",
  atlas = CHAR.G.jokeratlas.key,
  pos = { x = 37, y = 0 },
  config = { extra = { endofround = 10, will_receive = false } },
  loc_vars = function(self, info_queue, card) return { vars = { card.ability.extra.endofround } } end,
  rarity = 2,
  cost = 5,
  blueprint_compat = false,
  calculate = function(self, card, context)
    if context.final_scoring_step then
      if (hand_chips * mult) > G.GAME.blind.chips then
        card.ability.extra.will_receive = true
        return {
          message = "Crunchyroll Approved"
        }
      end
    end
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.will_receive then
      card.ability.extra.will_receive = false
      return card.ability.extra.endofround
    end
  end
}
-- TODO: Give effect before next commit

