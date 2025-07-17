---@diagnostic disable: duplicate-set-field
sg = SMODS.Blind {
    key = "bigmanacle",

    boss = {min = 800000, max =16},
    boss_colour = HEX("ffff96"),
    atlas = CHAR.G.blindatlas.key,
    pos = {x=0,y=16},
    mult = 3

}

sg.set_blind = function(self)

    G.hand:change_size(-2)
end
sg.disable = function(self)
    print("Cannot be disabled!")
end

sg.defeat = function(self)
    G.hand:change_size(2)
end