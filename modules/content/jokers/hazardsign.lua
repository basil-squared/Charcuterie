SMODS.Joker {
	key = "aspl_hazardsign",
	loc_txt = {
		name = "Hazard Sign",
		text = {"Gains {X:chips,C:white}X#1#{} {C:chips}Chips{} every time", "an {C:astropulvis_unstable}Unstable{} card activates.","{C:inactive,S:0.5}(currently {}{X:chips,C:white,S:0.5}X#2# {}{C:inactive,S:0.5}.)"}
	},
	atlas = ASPL.G.jokeratlas.key,
	pos = {x = 17,y=0},
	config = {extra = {xchips = 0.3, totalxchips = 1.0}},
	loc_vars = function(self,info_queue)
		return {vars={self.config.extra.xchips, self.config.extra.totalxchips}}
	end,
	rarity = 2,

}