

SMODS.Back {
    key = "deflation_deck",
    atlas = ASPL.G.deckatlas.key,
    pos = {x = 0, y = 0},
    loc_txt =  {
        name = "Deflation Deck",
        text = {"Start with {C:attention}$#1#{}.", "You are {C:red}unable{}","to earn any more", "through the course of the run"}

    },
    config = { extra = {money_start = 100}},
    loc_vars = function(self, info_queue,card)
        return {vars = {self.config.extra.money_start}}
    end
}

