CHAR.UI = {}

open_lyr_UI = function()
    CHAR.UI.lyrics = UIBox({
   definition = lyr_disp_ui(),
   config = {type = "cm"}
    })
end