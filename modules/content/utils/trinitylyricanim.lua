---@diagnostic disable: undefined-global
---
-- yall like events? well theres like 300+ in here so hopefully you're satisfied
--[[ this breaks when it pauses, but honestly im just gonna make it to where
    the game makes you lose if you pause, to discourage it happening
    only the best game design at charcuterie
]]

-- touch the rust code and i break your god damn fingers
CHAR.G.IMAGE_SHOW = CHAR.G.MODPATH .. "resources/helps/show_image.exe"
CHAR.FUNC.rewrite_lyr = function()
    local w,h = love.window.getDesktopDimensions()
    print(w .. "," .. h)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.45 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A LU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.65 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.85 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PA")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PARA")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.15 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("IN A LUCID PARADISE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.65 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1.85 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.05 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.25 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.4 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 2.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU COME HERE TO BREAK THE TIME")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.45 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.75 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PRO")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAG")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.05 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAGON")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("I'LL MAKE YOU PROTAGONIST")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AF")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.65 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 4.95 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.15 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N'")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.45 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.55 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.57 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.59 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 5.61 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("AFTER WE PLAY HIDE N' SE-EEEEEEEEE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.55 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SOR")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.75 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 6.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE ENT")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.45 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("LEAVE YOUR SORROWS BY THE ENTRANCE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.95 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE AL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 7.95 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE AL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.4 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.75 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE EX")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 8.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("YOU'RE ALREADY ON THE EXIT")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.4 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.55 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FAL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.7 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 9.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM ")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.25 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE SKY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.25  * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ROCKS ARE FALLING FROM THE SKY")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.65 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 10.95 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.05 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.35 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS SUN")
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 11.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.refresh_lyr_UI("ALL YOU CAN FEEL IS SUNSHINE")
            CHAR.FUNC.prepare_window_manip()
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 12.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(500,500,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_4.png")
            CHAR.FUNC.refresh_lyr_UI("LETS")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 12.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(0,h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_5.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 12.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(500,500,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_6.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY A")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 13.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_7.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY A GAME")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 13.7 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            CHAR.FUNC.refresh_lyr_UI("FOR")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 14.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h/2,0.4)
            CHAR.FUNC.refresh_lyr_UI("FOR OLD")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 14.4 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",0,w),h*.75,0.4)
            CHAR.FUNC.refresh_lyr_UI("FOR OLD TIME'S")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 14.8 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",0,w),h/2,0.4)
            CHAR.FUNC.refresh_lyr_UI("FOR OLD TIME'S SAKE")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 15.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_4.png")
            CHAR.FUNC.refresh_lyr_UI("LETS")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 15.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_5.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 15.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_6.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY A")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 16.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/frame_7.png")
            CHAR.FUNC.refresh_lyr_UI("LETS PLAY A GAME")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 16.7 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",w/3,w),h,0.4)
            
            CHAR.FUNC.refresh_lyr_UI("ARE")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 17.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",0,w),700,0.4)
            
            CHAR.FUNC.refresh_lyr_UI("ARE YOU")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 17.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            CHAR.FUNC.tween_to_winpos(pseudorandom("rewrite12wrfsfc3",0,w),700,0.4)
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/areyouready.png")
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("ARE YOU READY????")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 18.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WEL")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 18.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WELCOME")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 18.6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("WELCOME TO")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 18.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WELCOME TO MY")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 19.3 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("WELCOME TO MY BACK")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 19.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("WELCOME TO MY BACKDOOR")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 19.7 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 19.85 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS PLACE")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 20 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS PLACE IS")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 20.15 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS PLACE IS BUILT")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 20.5 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS PLACE IS BUILT FOR")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 20.65 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("THIS PLACE IS BUILT FOR YOU")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("WHO'S")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21.2 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            async_exec(CHAR.G.IMAGE_SHOW .. " ".. CHAR.G.MODPATH .. "resources/iamgod.png")
            CHAR.FUNC.refresh_lyr_UI("WHO'S AL")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21.4 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21.6 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS HUN")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21.75 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS HUN")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 21.9 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS HUNGRY")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 22.1 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS HUNGRY FOR")
            
            return true
        end
    },'other'))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 22.25 * G.SETTINGS.GAMESPEED,
        blocking = false,
        blockable = false,
        func = function()
            
            
            
            
            
            
            
            
            CHAR.FUNC.refresh_lyr_UI("WHO'S ALWAYS HUNGRY FOR MORE")
            
            return true
        end
    },'other'))
    
end