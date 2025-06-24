CHAR.WINFUNC = {}
CHAR.WINFUNC.FOUR_CORNERS = function()
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.6,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.tween_to_winpos(h,0,0.6)
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.tween_to_winpos(h,w,0.6)
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.tween_to_winpos(0,w,0.6)
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.4,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.tween_to_winpos(0,0,0.6)
            return true
        end
    },'other'))
end