return {
	descriptions = {
		Back = {
			b_astropulvis_ichor = {
				name = "Ichor Deck",
				text = {"Find {C:astropulvis_ritual}Ritual Cards{}", "in the shop, start with one {C:attention}Phase{}"}
			},
			b_astropulvis_deflation = {
				name = "Deflation Deck",
				text = {
					"Start with {C:attention}$#1#{}.",
					"You are {C:red}unable{}",
					"to earn any more",
					"through the course of the run"
				}
			}
		},
		Blind = {
			bl_astropulvis_castle = {
				name = "The Castle",
				text = {"Super large blind"}
			},
			bl_astropulvis_fortress = {
				name = "The Fortress",
				text = {"Absurdly large blind"}
			},
			bl_astropulvis_seer = {
				name = "The Seer",
				text = {"Curse all played cards."}
			},
			bl_astropulvis_ocean = {
				name = "The Ocean",
				text = {"Resets played cards back to base form."}
			},
			bl_astropulvis_debtcollector = {
				name = "The Debt Collector",
				text = {"Lose $1 per card played. If money is less than $0, double blind requirement"}
			},
			bl_astropulvis_dip = {
				name = "The Dip",
				text = {"Cards have no suits"}
			},
			bl_astropulvis_parasite = {
				name = "The Parasite",
				text = {"X0.75 Mult and Chips after calculation is complete."}
			},
			bl_astropulvis_commander = {
				name = "The Commander",
				text = {"Disable a random suit every hand."}
			},
			bl_astropulvis_tempest = {
				name = "The Tempest",
				text = {"Unplayed cards get shuffled back into the deck."}
			},
			bl_astropulvis_equalizer = {
				name = "The Equalizer",
				text = {"All hands start at 1 Mult and 30 Chips."}
			},
			bl_astropulvis_ricochet = {
				name = "The Ricochet",
				text = {"25% of scored hand added to blind requirement."}
			},
			bl_astropulvis_superglue = {
				name = "The Superglue",
				text = {"-2 Hand Size"}
			},
			bl_astropulvis_assailant = {
				name = "Amethyst Assailant",
				text = {"Stupendously large blind"}
			},
			bl_astropulvis_orchidoverlord = {
				name = "Orchid Overlord",
				text = {"For when you think you're too big to fail..."}
			}
		},
		Edition = {},
		Enhanced = {
			m_astropulvis_cursed = {
				name = "Cursed Card",
				text = {"After being played 3 times, {C:red}Debuffs itself.{}", "{s:0.7,C:inactive}#1# plays left.{}"}
			},
			m_astropulvis_unstable = {
				name = "Unstable Card",
				text = {
					"{X:mult,C:white}X#1#{} Mult.",
					"{C:green}#2# in #3# {}chance to add #4# more",
					" {C:astropulvis_unstable}Unstable{} cards to the deck."
				}
			},
			m_astropulvis_purified = {
				name = "Purified Card",
				text = {
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
					"{X:mult,C:white}x#3#{} Mult while held in hand."
				}
			},
			m_astropulvis_galactical = {
				name = "Galactical Card",
				text = {"{C:green}#1# in #2# chance{} to upgrade", "the hand this card is played in."}
			}
		},
		Joker = {
			j_astropulvis_goldencheese = {
				name = "Golden Cheese Cookie",
				text = {"Earn {X:attention,C:white}X2{} dollars", "{S:0.5,C:inactive}'Divine Radiance!'"}
			},
			j_astropulvis_whitelily = {
				name = "White Lily Cookie",
				text = {""}
			},
			j_astropulvis_bloatware = {
				name = "Bloatware",
				text = {
					"{X:purple,C:white}X#1#{} {C:chips}Chips{} and {C:mult}Mult{}.",
					"{C:green}#2# in #3#{} chance to spawn #4# {C:red}Debuffed{} cards into your hand."
				}
			},
			j_astropulvis_crazyeight = {
				name = "Crazy 8",
				text = {"For every {C:attention}8{} Played,", "grants {C:white,X:mult}x#1#{} Mult."}
			},
			j_astropulvis_estrogen = {
				name = "Estrogen",
				text = {"Played face cards have a {C:green}#1# in #2#{} chance to become {C:attention}Queens{}"}
			},
			j_astropulvis_halley = {
				name = "Halley's Comet",
				text = {
					"For every {C:attention}5{} Hands played,",
					"generate 3 {C:dark_edition}Negative{} {C:planet}Planet Cards{} for your",
					"{C:attention}most played{} hand.",
					"{S:0.7,C:inactive}(currently #1#){}"
				}
			},
			j_astropulvis_hazardsign = {
				name = "Hazard Sign",
				text = {
					"Gains {X:chips,C:white}X#1#{} Chips every time",
					"an {C:astropulvis_unstable}Unstable{} card activates.",
					"{C:inactive,S:0.5}(currently {}{X:chips,C:white,S:0.5}X#2# {}{C:inactive,S:0.5}.)"
				}
			},
			j_astropulvis_interstellar = {
				name = "Interstellar",
				text = {"{C:astropulvis_galactical}Galactical{} cards give {C:mult}+#1#{} Mult."}
			},
			j_astropulvis_juxtaposition = {
				name = "Juxtaposition",
				text = {
					"Remove {C:dark_edition}Negative{} from all Jokers you have,",
					"{C:attention}+1{} Joker Slot every time {C:dark_edition}Negative{} is removed.",
					"{S:0.6,C:inactive}Currently +#1# Joker Slots.{}"
				}
			},
			j_astropulvis_mothership = {
				name = "Mothership",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each",
					"{C:astropulvis_galactical}Galactical{} Card in your {C:attention}Full Deck{}",
					"{S:0.5,C:inactive}(Currently{} {X:mult,C:white,S:0.5}X#2#{}{S:0.5,C:inactive} Mult){}"
				}
			},
			j_astropulvis_pcb = {
				name = "PCB",
				text = {"Copies ability of leftmost", "and rightmost Jokers."}
			},
			j_astropulvis_reactorrod = {
				name = "Reactor Rod",
				text = {
					"{C:astropulvis_unstable}Unstable{} cards now grant {X:mult,C:white}X6{} Mult,",
					"but will now create {C:attention}four{} cards when the effect activates."
				}
			},
			j_astropulvis_schematic = {
				name = "Schematic",
				text = {"Copies ability of", "{C:attention}Joker{} to the left"}
			},
			j_astropulvis_starchild = {
				name = "Starchild",
				text = {
					"{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult for every {C:astropulvis_galactical}Galactical{} Face card played."
				}
			},
			j_astropulvis_subplot = {
				name = "Subplot",
				text = {
					"If a single {C:attention}played card{} does",
					"not score it permanently",
					"gains {X:mult,C:white}X#1#{} Mult"
				}
			},
			j_astropulvis_systemofmessages = {
				name = "System of Messages",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each {C:astropulvis_unstable}Unstable{} card in your {C:attention}full deck.{}",
					"{S:0.5,C:inactive}(Currently {}{S:0.5,X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"
				}
			},
			j_astropulvis_thej = {
				name = "The J",
				text = {"For every joker, gain {X:mult,C:white}X#1#{} Mult."}
			},
			j_astropulvis_theusual = {
				name = "The Usual",
				text = {
					"{X:mult,C:white}X#1#{} Mult when playing",
					"Your most played hand.",
					"{S:0.7,C:inactive}Currently #2#.{}"
				}
			},
			j_astropulvis_virtuous = {
				name = "Virtuous Joker",
				text = {
					"Awards {C:attention}$1{} per {C:astropulvis_purified}Purified{} card",
					"in your full deck at end of round.",
					"{S:0.7,C:inactive}(currently{}{S:0.7,C:attention} $#1#{}{S:0.7,C;inactive}.)"
				}
			},
			j_astropulvis_wargames = {
				name = "War Games",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult for every hand played",
					"not containing an {C:astropulvis_unstable}Unstable{}  card.",
					"{S:0.5,C:inactive}(deck must contain at least 5 unstable cards.){}",
					"{S:0.5,C:inactive}(Currently {}{X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"
				}
			},
			j_astropulvis_ufo = {
				name = "U.F.O",
				text = {"Turns any face card played into a {C:astropulvis_galactical}Galactical{} Card. "}
			}
		},
		Other = {},
		Planet = {},
		Spectral = {},
		Stake = {},
		Tag = {},
		Tarot = {},
		Voucher = {},
		Ritual = {},
		Element = {}
	},
	misc = {
		achievement_descriptions = {},
		achievement_names = {},
		blind_states = {},
		challenge_names = {},
		collabs = {},
		dictionary = {},
		high_scores = {},
		labels = {},
		poker_hand_descriptions = {},
		poker_hands = {},
		quips = {},
		ranks = {},
		suits_plural = {},
		suits_singular = {},
		tutorial = {},
		v_dictionary = {},
		v_text = {}
	}
}
