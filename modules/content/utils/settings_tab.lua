
local EvilConfigTab = function()
    local fun_config_nodes = {
        {
            n = G.UIT.R,
            config  = {
                align = 'cm'
            },
            nodes = {
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            string = localize('char_config_flavor'),
                            colours = {G.C.WHITE,},
                            scale = 0.4,
                            shadow = true,
                        })
                    }
                }
            }
        }
    }
    fun_config_nodes[#fun_config_nodes+1] = create_toggle({
    label = 'Overclock Retriggers',
    active_colour = HEX("00F0FF"),
    ref_table = CHAR.G.CONF,
    ref_value = 'overclock_retriggers',
})
    fun_config_nodes[#fun_config_nodes+1] = create_toggle({
        label = 'More Obvious Overclock Hints',
        active_colour = HEX("00F0FF"),
        ref_table = CHAR.G.CONF,
        ref_value = 'simpler_oc_hints',
})
return {
    n = G.UIT.ROOT,
    config = {
        emboss = 0.05,
        minh = 6,
        r = 0.1,
        minw = 10,
        align = 'cm',
        padding = 0.2,
        colour = G.C.BLACK,
    },
    nodes = fun_config_nodes
}
end
SMODS.current_mod.config_tab = function()
	return  EvilConfigTab()
		
	
end