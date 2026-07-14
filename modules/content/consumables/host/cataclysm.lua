local function triple_numeric_fields(t)
    if type(t) ~= 'table' then return end
    for k, v in pairs(t) do
        if type(v) == 'number' and k ~= 'bonus' and k ~= 'card_limit' then
            t[k] = v * 3
        end
    end
end


SMODS.Consumable {
    key = 'cataclysm',
    set = 'host',
    atlas = CHAR.G.hostatlas.key,
    pos = {x=2,y=0},
    can_use = function(self,card) 
        if #G.consumeables.highlighted >= 2 then return true else return false end
    end,
    use = function(self,card,area,copier)
        local selconsumable
        for k,v in ipairs(G.consumeables.highlighted) do
            if v ~= card then
                selconsumable = v
            end
        end
        
        local original_center = selconsumable.config.center
        local patched_center = {}
        -- shallow copyin g
        for k, v in pairs(original_center) do
            patched_center[k] = v
        end
        setmetatable(patched_center, getmetatable(original_center))

        triple_numeric_fields(selconsumable.ability)
        triple_numeric_fields(selconsumable.ability.extra)
        local original_use = patched_center.use
        patched_center.use = function(self,card,area,copier)
            local ret = original_use(self,card,area,copier)
            if #G.jokers.cards > 0 then
                local target = pseudorandom_element(G.jokers.cards,pseudoseed('cataclysm_wipe'))
                SMODS.destroy_cards(target)
            end
            return ret
        end
    
        selconsumable.config.center = patched_center
    end

}