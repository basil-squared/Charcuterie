local lu_ref = love.update
CHAR.FUNC.prepare_window_manip = function()
    if love.window.getFullscreen then
        love.window.setFullscreen(false)
    end
    love.window.setMode(854,480,{resizable = false, centered = true})
    love.resize(854,480)
end
CHAR.G.window_tween = nil
CHAR.FUNC.tween_to_winpos = function(x,y,sec)
    local curr_x, curr_y = love.window.getPosition()
    CHAR.G.window_tween = {
        start_x = curr_x,
        start_y = curr_y,
        target_x = x,
        target_y = y,
        start_time = love.timer.getTime(),
        duration = sec
    }
    
end

CHAR.FUNC.update_window_tween = function(dt)
    if not CHAR.G.window_tween then return end
    local t = CHAR.G.window_tween
    local current_time = love.timer.getTime()
    local elapsed = current_time - t.start_time
    local prog = math.min(elapsed / t.duration, 1.0)
---
    local function ease_in_out_expo(p)
        if p == 0 or p == 1 then
            return p
        elseif p < 0.5 then
            return 0.5 * 2^(20 * p - 10)
        else
            return 0.5 * (2-2^(10 - 20 * p)) 
        end
    end
    local eased = ease_in_out_expo(prog)
    local new_x = t.start_x + (t.target_x - t.start_x) * eased
    local new_y = t.start_y + (t.target_y - t.start_y) * eased
    love.window.setPosition(math.floor(new_x), math.floor(new_y))

    if prog >= 1.0 then
        CHAR.G.window_tween = nil
    end
end

function love.update(dt)
    CHAR.FUNC.update_window_tween(dt)
    return lu_ref(dt)
end