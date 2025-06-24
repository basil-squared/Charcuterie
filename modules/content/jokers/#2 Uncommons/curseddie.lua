SMODS.Joker {
    key = "cursed_die",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 40, y= 0},
    rarity = 2,
    cost = 5,
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v * 4
        end
        CHAR.FUNC.ease_risk(999)
        G.GAME.RISK_LOCK = true
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 4
        end
        G.GAME.RISK_LOCK = false
        CHAR.FUNC.ease_risk(-100 + (G.GAME.round_resets.ante * 10))
    end,
    calculate = function(self,card,context)
        if not G.GAME.RISK_LOCK then
            CHAR.FUNC.ease_risk(100)
            G.GAME.RISK_LOCK = true
        end
    end
    
}