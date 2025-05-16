sg = SMODS.Blind {
    key = "superglue",

    boss = {min = 8, max =16},
    boss_colour = HEX("ffff96"),

}

sg.set_blind = function(self)
    print("test")
    G.hand:change_size(-2)
end
sg.disable = function(self)
    print("Cannot be disabled!")
end

sg.defeat = function(self)
    G.hand:change_size(2)
end