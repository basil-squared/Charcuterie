SMODS.Back {
    key = 'wrong',
    atlas = CHAR.G.deckatlas.key,
    pos = { x = 7, y = 0 },
    config = { extra = { decline = 1 } },
    loc_vars = function (self, info_queue, back)
        return {
            vars = {self.config.extra.decline}
        }
    end,
    apply  = function (self, back)
        
    end
}