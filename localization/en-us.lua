return {
  descriptions = {
    Back = {
      b_astropulvis_ichor = {
        name = "Ichor Deck",
        text = { "Find {C:astropulvis_ritual}Ritual Cards{}", "in the shop, start with one {C:attention}Phase{}" }
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
        text = { "Super large blind" }
      },
      bl_astropulvis_fortress = {
        name = "The Fortress",
        text = { "Absurdly large blind" }
      },
      bl_astropulvis_seer = {
        name = "The Seer",
        text = { "Curse all played cards." }
      },
      bl_astropulvis_ocean = {
        name = "The Ocean",
        text = { "Resets played cards back to base form." }
      },
      bl_astropulvis_debtcollector = {
        name = "The Debt Collector",
        text = { "Lose $1 per card played. If money is less than $0, double blind requirement" }
      },
      bl_astropulvis_dip = {
        name = "The Dip",
        text = { "Cards have no suits" }
      },
      bl_astropulvis_parasite = {
        name = "The Parasite",
        text = { "X0.75 Mult and Chips after calculation is complete." }
      },
      bl_astropulvis_commander = {
        name = "The Commander",
        text = { "Disable a random suit every hand." }
      },
      bl_astropulvis_tempest = {
        name = "The Tempest",
        text = { "Unplayed cards get shuffled back into the deck." }
      },
      bl_astropulvis_equalizer = {
        name = "The Equalizer",
        text = { "All hands start at 1 Mult and 30 Chips." }
      },
      bl_astropulvis_ricochet = {
        name = "The Ricochet",
        text = { "25% of scored hand added to blind requirement." }
      },
      bl_astropulvis_superglue = {
        name = "The Superglue",
        text = { "-2 Hand Size" }
      },
      bl_astropulvis_assailant = {
        name = "Amethyst Assailant",
        text = { "Stupendously large blind" }
      },
      bl_astropulvis_orchidoverlord = {
        name = "Orchid Overlord",
        text = { "For when you think you're too big to fail..." }
      }
    },
    Edition = {
      e_astropulvis_bleached = {
        name = "Bleached",
        text = { "Card is {C:attention}Suitless{}"}
      }
    },
    Enhanced = {
      m_astropulvis_cursed = {
        name = "Cursed Card",
        text = { "After being played 3 times, {C:red}Debuffs itself.{}", "{s:0.7,C:inactive}#1# plays left.{}" }
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
        text = { "{C:green}#1# in #2# chance{} to upgrade", "the hand this card is played in." }
      },
      m_stone = {
        name = "Stone Card",
        text = {"{C:chips}+50{} Chips","{C:inactive}Suitless{} and {C:attention}Rankless{}"}
      }
    },
    Joker = {
      j_astropulvis_goldencheese = {
        name = "Golden Cheese Cookie",
        text = { "Earn {X:attention,C:white}X2{} dollars", "{S:0.5,C:inactive}'Divine Radiance!'" }
      },
      j_astropulvis_whitelily = {
        name = "White Lily Cookie",
        text = { "" }
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
        text = { "For every {C:attention}8{} Played,", "grants {C:white,X:mult}x#1#{} Mult." }
      },
      j_astropulvis_estrogen = {
        name = "Estrogen",
        text = { "Played face cards have a {C:green}#1# in #2#{} chance to become {C:attention}Queens{}" }
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
        text = { "{C:astropulvis_galactical}Galactical{} cards give {C:mult}+#1#{} Mult." }
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
        text = { "Copies ability of leftmost", "and rightmost Jokers." }
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
        text = { "Copies ability of", "{C:attention}Joker{} to the left" }
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
        text = { "For every joker, gain {X:mult,C:white}X#1#{} Mult." }
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
        text = { "Turns any face card played into a {C:astropulvis_galactical}Galactical{} Card. " }
      },
      j_astropulvis_boredjoker = {
        name = "Bored Joker",
        text = { "{C:mult}+7{} Mult when hand contains a", "{C:attention}Greyscale Flush{}" }
      },
      j_astropulvis_concretemixer = {
        name = "Concrete Mixer",
        text = { "{C:green}#1# in #2#{} chance to turn a card ", "into a {C:enhanced}Stone Card{}" }
      },
      j_astropulvis_apatheticjoker = {
        name = "Apathetic Joker",
        text = { "{C:chips}+70{} Chips when hand contains a", "{C:attention}Greyscale Flush{}" }
      },
      j_astropulvis_ninetofive = {
        name = "9 to 5",
        text = { "{C:chips}+15{} Chips for every {C:inactive}Suitless{} card", "in your {C:attention}Full Deck.{}" }
      },
      j_astropulvis_porridge = {
        name = "Porridge",
        text = { "{C:inactive}Suitless{} cards give {X:mult,C:white}X2{} Mult", "for {C:attention}#1#{} hands.", "{C:inactive,S:0.5}(#2# hands remaining){}" }
      }
    },
    Other = {
      aspl_txt_risk = {
        name = "Risk Based",
        text = {
          "This item is {C:attention}Risk Based",
          "chance events are",
          "not truly random"
        }
      },
      astropulvis_obscure_seal = {
        name = "Obscured Seal",
        text = {"The card this is applied to","is {C:attention}Rankless{}"}
      },
      astropulvis_lime_seal = {
        name = "Lime Seal",
        text = {"{C:green}#1# in #2#{} chance to","create an {C:astropulvis_unstable}Unstable{} card when scored"}
      },
      astropulvis_brilliant_seal = {
        name = "Brilliant Seal",
        text = {"{C:white,X:chips}X#1#{} Chips if card is {C:enhanced}Enhanced{}."}
      }

    },
    Planet = {
      c_astropulvis_arrakis = {
        name = "Arrakis",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
               }
      },
      c_astropulvis_abafar = {
        name = "Abafar",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
        }
      },
      c_astropulvis_theia = {
        name = "Theia",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
        }
      }
    },
    Spectral = {},
    Stake = {},
    Tag = {},
    Tarot = {},
    Voucher = {
      v_astropulvis_brimstone = {
        name = "Brimstone",
        text = {
          "Converts one random card",
          "In your {C:attention}full deck{} into",
          "a {C:cursed}Cursed Card every round."
        }
      },
      v_astropulvis_divine = {
        name = "Divine Light",
        text = { "{C:astropulvis_purified}Purifies{} all played {C:astropulvis_cursed}Cursed Cards{}" }
      }
    },
    ritual = {
      c_astropulvis_peer = {
        name = "Peer",
        text = {
          "{C:red}Destroy{} a random joker.",
          "{C:astropulvis_purified}Purify{} 2 selected {C:red}Cursed{} cards."
        }
      },
      c_astropulvis_bloodpact = {
        name = "Blood Pact",
        text = { "Spawn a random {C:red}Eternal Rare{} Joker." }
      },
      c_astropulvis_chippedcoin = {
        name = "Chipped Coin",
        text = {
          "{C:green}#1#%{} chance to {C:attention}double{} money.",
          "{C:red}#2#%{} Chance to backfire and set money to {C:money}$0{} instead."
        }
      },
      c_astropulvis_phase = {
        name = "Phase",
        text = {
          "{C:mult} Destroy{} the {C:attention}Leftmost{} or {C:attention}Rightmost{} Joker.",
          "Add {C:dark_edition}Negative{} to the other."
        }
      },
      c_astropulvis_roulette = {
        name = "Roulette",
        text = {
          "{C:green}#1#%{} chance to apply",
          " An {C:enhanced}Edition{} to a random joker,",
          "{C:red}#2#%{} chance to backfire,",
          "{C:red}removing{} an edition from a random joker."
        }
      },
      c_astropulvis_sever = {
        name = "Sever",
        text = { "{C:red}Destroy{} a random Joker.", "Summon 2 {C:red}Ritual Cards{}." }
      },
      c_astropulvis_strike = {
        name = "Strike",
        text = { "{C:red}Curse{} your hand.", "Earn {C:attention}$5{} for every card Cursed." }
      },
      c_astropulvis_summon = {
        name = "Summon",
        text = { "{C:red}Destroy{} 2 random {C:attention}Jokers{}", "{C:green}#1#%{} to create a {C:purple}Legendary{} Joker." }
      },
      c_astropulvis_alchemy = {
        name = "Alchemy",
        text = { "{C:green}#1#%{} chance to make entire hand {C:attention}Gold{}",
                 "{C:red}#2#%{} chance to debuff entire hand instead." }
      }
    },
    Element = {
      c_astropulvis_titanium = {
        name = "Titanium",
        text = { "Converts up to {C:attention}3{}", " selected cards into {C:enhanced}Steel{} Cards" }
      },
      c_astropulvis_plutonium = {
        name = "Plutonium",
        text = { "{C:green}#1#%{} Chance to add {C:astropulvis_unstable}Unstable{}", "to up to {C:attention}2{} selected cards,", "but {C:red}#2#%{} chance to destroy", "selected cards instead." }
      },
      c_astropulvis_neodymium = {
        name = "Neodymium",
        text = { "Make a selected {C:enhanced}Steel Card{} {C:dark_edition}Negative{}" },

      },
      c_astropulvis_zinc = {
        name = "Zinc",
        text = { "Adds {C:attention}Brilliant Seal{} to a ", "selected {C:enhanced}Steel Card{}" }
      }
    },
    tooltips = {

    }
  },
  misc = {
    achievement_descriptions = {},
    achievement_names = {},
    blind_states = {},
    challenge_names = {},
    collabs = {},
    dictionary = {

    },
    high_scores = {},
    labels = {
      astropulvis_bleached = "Bleached",
      astropulvis_brilliant_seal = "Brilliant Seal",
      astropulvis_lime_seal = "Lime Seal",
      astropulvis_obscure_seal = "Obscured Seal"
    },
    poker_hands = {
      ['astropulvis_grayflush'] = "Grayscale Flush",
      ['astropulvis_graystraight'] = "Grayscale Straight",
      ['astropulvis_grayhouse'] = "Grayscale House"
    },
    poker_hand_descriptions = {
      ['astropulvis_grayflush'] = {
        "5 Suitless cards",
      },
      ['astropulvis_graystraight'] = {
        "5 Suitless cards (consecutive ranks)"
      },
      ['astropulvis_grayhouse'] = {
        'a Suitless Three of a Kind',
        'and a Suitless Pair.'
      }
    },

    quips = {},
    ranks = {},
    suits_plural = {},
    suits_singular = {},
    tutorial = {},
    v_dictionary = {},
    v_text = {}
  }
}
