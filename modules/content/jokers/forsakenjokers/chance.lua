SMODS.Joker {
    key = "chance",
    atlas = CHAR.G.jokeratlas.key,
    pos = {x = 45,y=0 },
    config = {extra= {good_chance = 7,bad_chance = 17.7,dollars_given_small = 7,chips_taken = 77,holy_shit = 777}},
    loc_vars = function(self,info_queue,card)
        return {vars = {(G.GAME.probabilities.normal or 1),card.ability.extra.good_chance,card.ability.extra.dollars_given_small,card.ability.extra.bad_chance,card.ability.extra.chips_taken,card.ability.extra.holy_shit}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if pseudorandom("chance_time") < G.GAME.probabilities.normal / card.ability.extra.holy_shit then
                return {
                    x_mult = card.ability.extra.holy_shit,
                    dollars = card.ability.extra.holy_shit,

                }
            end
            if pseudorandom("FUCK FUCK FUCK FUCK FUCk") < G.GAME.probabilities.normal / card.ability.extra.good_chance then
                return {
                    dollars = card.ability.extra.dollars_given_small
                }
            end
            if pseudorandom("damn, that's harsh") < G.GAME.probabilities.normal / card.ability.extra.bad_chance then
                return {
                    chips = -card.ability.extra.chips_taken
                }
            end
        end
    end
}