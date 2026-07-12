print("I have been loaded")

SMODS.Shader({ key = "bleached", path = "bleached.fs" })
SMODS.Shader({ key = "etched", path = "etched.fs" })
SMODS.Shader({ key = "melty", path = "melty.fs" })
local function mix_colour(c, target, amt)
    return {
        c[1] + (target[1] - c[1]) * amt,
        c[2] + (target[2] - c[2]) * amt,
        c[3] + (target[3] - c[3]) * amt,
        1
    }
end
SMODS.Shader({
    key = "rot_suit",
    path = "rot_suit.fs",
    send_vars = function(self, card)
    local suit_colour = (card and card.base and G.C.SUITS[card.base.suit]) or G.C.WHITE

    local dark_colour = mix_colour(suit_colour, G.C.BLACK, 0.35)
    local light_colour = mix_colour(suit_colour, G.C.WHITE, 0.35)

    return {
    dark_hue = 0.287,
    med_hue = 0.813,
    light_hue = 0.681,
    hue_thresh = 0.05,
    min_saturation = 0.5,    
    dark_colour = dark_colour,
    light_colour = light_colour,
}
    end,
})