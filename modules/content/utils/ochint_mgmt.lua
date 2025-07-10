-- This is for the config option to make the overclock hints more obvious,
-- meant to be plugged into info_queue to make the choice
-- this is the best way to do this

function CHAR.FUNC.ochint_mgr(key)
    local locNames = G.localization.descriptions.Other
    if locNames['char_txt_ochint_' .. key] and not CHAR.G.CONF.simpler_oc_hints then
        return {set = 'Other',key = 'char_txt_ochint_' .. key}
    elseif locNames['char_txt_ochint_obvious' .. key] and CHAR.G.CONF.simpler_oc_hints then
        return {set = 'Other', key = 'char_txt_ochint_obvious'..key}        
    else
        return {set = 'Other', key = 'char_txt_whoops'}
    end

end