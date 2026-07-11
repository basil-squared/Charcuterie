
-- table entries are like this
-- { filter = function(card) -> bool, mod = number}



local set_cost_ref = Card.set_cost 
function Card:set_cost()
    set_cost_ref(self)
    local total_mod = 1
    if G.GAME and G.GAME.card_cost_mods then
        for _, entry in pairs(G.GAME.card_cost_mods) do
        if entry.filter(self) then
            total_mod = total_mod + entry.mod
            
       end
    end
    end
    
    self.cost = math.floor(self.cost * total_mod)
end


function CHAR.FUNC.add_cost_entry(key,filter,mod)
    if G.GAME and G.GAME.card_cost_mods then
        G.GAME.card_cost_mods[key] = {filter = filter, mod=mod}
    end
    

end