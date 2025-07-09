-- God i need a fucking job

open_oc_UI = function()
    CHAR.UI.OC =
        UIBox(
        {
            definition = overclock_demonstration(),
            config = {type = "cm"}
        }
    )
end

function overclock_demonstration()
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            minh = 9,
            minw = 12,
            colour = G.C.BLACK,
            r = 0.1,
            padding = 0.2
        },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {align = "cm"},
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = "How Overclocks work",
                                    colour = G.C.DARK_EDITION,
                                    scale = 0.4
                                }
                            }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            minh = 7,
                            minw = 6,
                            colour = G.C.UI.TEXT_INACTIVE,
                            padding = 0.2,
                            r = 0.1
                        },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {
                                    align = "cm",
                                    colour = G.C.DARK_EDITION,
                                    r = 0.1,
                                    minh = 4.8,
                                    minw = 4
                                },
                                nodes = {
                                    {
                                        n = G.UIT.C,
                                        config = {
                                            align = "cm",
                                            padding = 0
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = {align = "cm"},
                                                nodes = {
                                                    {
                                                        n = G.UIT.T,
                                                        config = {
                                                            text = "1.",
                                                            colour = G.C.WHITE,
                                                            scale = 0.4
                                                        }
                                                    }
                                                }
                                            },
                                            {
                                                n = G.UIT.O,
                                                config = {
                                                    object = Sprite(
                                                        0,
                                                        0,
                                                        4.8366221350656 / 2,
                                                        6.9300126165033 / 2, -- Okay so, these values are APPARENTLY what the base game uses for card dimensions. i'm so sorry to whoever sees this
                                                        G.ASSET_ATLAS["Joker"],
                                                        {x = 6, y = 15}
                                                    )
                                                }
                                            },
                                            
                                        }
                                    }
                                }
                            },
                            {
                                n = G.UIT.C,
                                config = {
                                    align = "cm",
                                    colour = G.C.DARK_EDITION,
                                    r = 0.1,
                                    minh = 4.80,
                                    minw = 4
                                },
                                nodes = {
                                    
                                }
                            },
                            {
                                n = G.UIT.C,
                                config = {
                                    align = "cm",
                                    colour = G.C.DARK_EDITION,
                                    r = 0.1,
                                    minh = 4.8,
                                    minw = 4
                                },
                                nodes = {}
                            }
                        }
                    }
                }
            }
        }
    }
end
--[[
    look at me go,
    not finishing the crucial UI!
]]