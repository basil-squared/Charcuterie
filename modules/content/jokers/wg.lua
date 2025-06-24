SMODS.Joker {
	key = "aspl_wargames",
	atlas = ASPL.G.jokeratlas.key,
	pos = {x=16,y=0},
	loc_txt = {
		name = "War Games",
		text = {"Gains {X:mult,C:white}X#1#{} Mult for every hand played","not containing an {C:astropulvis_unstable}Unstable{}  card.","{S:0.5,C:inactive}(deck must contain at least 5 unstable cards.){}","{S:0.5,C:inactive}(Currently {}{X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"}
	},
	config = { extra = {xmult = 0.5, curr_xmult = 1.0}},
	loc_vars = function(self,info_queue)
		return {vars = {self.config.extra.xmult, self.config.extra.curr_xmult}}
	end
}