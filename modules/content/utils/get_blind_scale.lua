

local get_blind_amount_ref = get_blind_amount

function get_blind_amount(ante)
    local amount = get_blind_amount_ref(ante)
    local total_scaling = 1
    if G.GAME and G.GAME.blind_scaling_mods then
        for _, mod in pairs(G.GAME.blind_scaling_mods) do
        total_scaling = total_scaling * mod
    end
    end
    
    return amount * total_scaling
end

function CHAR.FUNC.set_blind_scale(key, scale_mod)
    if G.GAME and G.GAME.blind_scaling_mods then
        G.GAME.blind_scaling_mods[key] = scale_mod
    end
    
end