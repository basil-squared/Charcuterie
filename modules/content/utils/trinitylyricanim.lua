---@diagnostic disable: undefined-global
CHAR.FUNC.rewrite_lyr = function()
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.45,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A LU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.65,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.85,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PA")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PARA")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.15,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PARADISE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.65,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.85,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU COME")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.05,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.25,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO ")
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
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.6,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK THE TIME")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.3,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.45,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.6,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.75,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PRO")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.9,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAG")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.05,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAGON")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAGONIST")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.5,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AF")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.65,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.95,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.15,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.3,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N'")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.45,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.5,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.55,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.57,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.59,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.61,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEEEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.3,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.55,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SOR")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.75,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.9,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.1,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.3,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE ENT")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.45,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE ENTRANCE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.95,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE AL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.95,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE AL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.4,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.6,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.75,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE EX")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.9,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE EXIT")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.4,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.55,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FAL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.7,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.9,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.1,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.25,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE SKY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.25,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE SKY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.65,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.8,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.95,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.05,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.2,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.35,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS SUN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.5,
        blocking = true,
        blockable = false,
        func = function()
            local h,w = love.window.getDesktopDimensions()
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS SUNSHINE")
            return true
        end
    },'other'))
end