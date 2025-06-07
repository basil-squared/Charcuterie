return {
  descriptions = {
    Back = {
      b_charcuterie_ichor = {
        name = "Ichor Deck",
        text = { "Find {C:charcuterie_ritual}Ritual Cards{}", "in the shop"}
      },
      b_charcuterie_deflation = {
        name = "Deflation Deck",
        text = {
          "Start with {C:attention}$#1#{}.",
          "{C:red}no blind rewards"
          
        }
      },
      b_charcuterie_hardcore = {
        name = "Hardcore Deck",
        text = {
          "Start with {C:attention}$#1#{}",
          "All blinds are {C:red}Tier 3{}"
        }
      }
    },
    Blind = {
      bl_charcuterie_bigwall = {
        name = "The Castle",
        text = { "Super large blind" }
      },
      bl_charcuterie_biggerwall = {
        name = "The Fortress",
        text = { "Absurdly large blind" }
      },
      bl_charcuterie_seer = {
        name = "The Seer",
        text = { "Curse all played cards." }
      },
      bl_charcuterie_ocean = {
        name = "The Ocean",
        text = { "Resets played cards back to base form." }
      },
      bl_charcuterie_bigtooth = {
        name = "The Debt Collector",
        text = { "Lose $1 per card played.", "If money is less than $0,"," double blind requirement" }
      },
      bl_charcuterie_dip = {
        name = "The Dip",
        text = { "Cards have no suits" }
      },
      bl_charcuterie_parasite = {
        name = "The Parasite",
        text = { "X0.75 Mult and Chips","after calculation is complete." }
      },
      bl_charcuterie_commander = {
        name = "The Commander",
        text = { "Disable a random suit every hand." }
      },
      bl_charcuterie_tempest = {
        name = "The Tempest",
        text = { "Unplayed cards get shuffled back into the deck." }
      },
      bl_charcuterie_equalizer = {
        name = "The Equalizer",
        text = { "All hands start at 1 Mult and 30 Chips." }
      },
      bl_charcuterie_ricochet = {
        name = "The Ricochet",
        text = { "25% of scored hand added to blind requirement." }
      },
      bl_charcuterie_bigmanacle = {
        name = "The Superglue",
        text = { "-2 Hand Size" }
      },
      bl_charcuterie_assailant = {
        name = "Amethyst Assailant",
        text = { "Stupendously large blind" }
      },
      bl_charcuterie_orchidoverlord = {
        name = "Orchid Overlord",
        text = { "For when you think you're too big to fail..." }
      },
      bl_charcuterie_bighook = {
        name = "The Line",
        text = {"Discards 3 random cards","held in hand after every played hand"}
      },
      bl_charcuterie_biggerhook = {
        name = "The Sinker",
        text = {"Discards every card","not played after every played hand"}
      },
      bl_charcuterie_bigarm = {
        name = "The Body",
        text = {"Decrease level of played poker hand by 2"}
      },
      bl_charcuterie_biggerarm = {
        name = "The Genesis",
        text = {"Set level of played poker hand to 1"}
      },
      bl_charcuterie_biggertooth = {
        name = "The Loan Shark",
        text = {"Lose $2 per hand played.", "If money is less than 0, Square blind requirement."}
      },
      bl_charcuterie_biggermanacle = {
        name = "The Chipper",
        text = { "-5 Hand Size" }
      },
      bl_charcuterie_bigneedle = {
        name = "The Thread",
        text = {"Play only one hand, larger blind"}
      },
      bl_charcuterie_biggerneedle =  {
        name = "The Sword",
        text = {"Play only one hand and","start with 0 discards"}
      },
      bl_charcuterie_bighead = {
        name = "The Arrhythmia",
        text = {"Permanently debuff","played Hearts"}
      },
      bl_charcuterie_biggerhead = {
        name = "The Asystole",
        text = {"Permanently disable all played cards","if hand contains Hearts"}
      },
      bl_charcuterie_bigwindow = {
        name = "The Gate",
        text = {"Permanently debuff","played Diamonds"}
      },
      bl_charcuterie_biggerwindow = {
        name = "The Skylight",
        text = {"Permanently disable all played cards","if hand contains Diamonds"}
      },
      bl_charcuterie_small_t2 = {
        name = "Small Blind"

      },
      bl_charcuterie_small_t3 = {
        name = "Small Blind"

      },
      bl_charcuterie_big_t2 = {
        name = "Big Blind"

      },
      bl_charcuterie_big_t3 = {
        name = "Big Blind"

      }
    },
    Partner = {
      pnr_charcuterie_mini_pcb = {
        name = "Lil' PCB",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "retrigger either the {C:attention} leftmost",
          "or {C:attention}rightmost{} Joker"
        }
      },
      pnr_charcuterie_mini_stellar = {
        name = "Explorer",
        text = {
          "{C:charcuterie_galactical}Galactical{} cards give",
          "{X:mult,C:white}X#1#{} Mult"
        }
      }
    },
    Edition = {
      e_charcuterie_bleached = {
        name = "Bleached",
        text = { "Card is {C:attention}Suitless{}"}
      },
      e_charcuterie_melty = {
        name = "Melty",
        text = {"{C:green}#1#%{} chance to give ","{X:mult,C:white}X#2#{} mult","{C:red}#3#%{}chance to destroy itself instead."}
      }
    },
    Enhanced = {
      m_charcuterie_cursed = {
        name = "Cursed Card",
        text = { "After being played 3 times, {C:red}Debuffs itself.{}", "{s:0.7,C:inactive}#1# plays left.{}" }
      },
      m_charcuterie_unstable = {
        name = "Unstable Card",
        text = {
          "{X:mult,C:white}X#1#{} Mult.",
          "{C:green}#2# in #3# {}chance to add #4#",
          "cards with {C:attention}Lime Seal{} to the deck."
        }
      },
      m_charcuterie_purified = {
        name = "Purified Card",
        text = {
          "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
          "{X:mult,C:white}x#3#{} Mult while held in hand."
        }
      },
      m_charcuterie_galactical = {
        name = "Galactical Card",
        text = { "{C:green}#1# in #2# chance{} to upgrade", "the hand this card is played in." }
      },
      m_stone = {
        name = "Stone Card",
        text = {"{C:chips}+50{} Chips","{C:inactive}Suitless{} and {C:attention}Rankless{}"}
      },
      m_charcuterie_arc = {
        name = "Arc Card",
        text = {"when played,","{C:green}#1# in #2#{} chance to","{C:attention}retrigger{} the","played card to the","{C:attention}right{} of this card {C:attention}thrice{}"}
      }
    },
    Joker = {
      j_charcuterie_goldencheese = {
        name = "Golden Cheese Cookie",
        text = { "Earn {X:attention,C:white}X2{} dollars", "{S:0.5,C:inactive}'Divine Radiance!'" }
      },
      j_charcuterie_whitelily = {
        name = "White Lily Cookie",
        text = { "" }
      },
      j_charcuterie_bloatware = {
        name = "Bloatware",
        text = {
          "{X:purple,C:white}X#1#{} {C:chips}Chips{} and {C:mult}Mult{}.",
          "{C:green}#2# in #3#{} chance to spawn #4# {C:red}Debuffed{} cards into your hand."
        }
      },
      j_charcuterie_crazyeight = {
        name = "Crazy 8",
        text = { "For every {C:attention}8{} Played,", "grants {C:white,X:mult}x#1#{} Mult." }
      },
      j_charcuterie_estrogen = {
        name = "Estrogen",
        text = { "Played face cards have a {C:green}#1# in #2#{} chance to become {C:attention}Queens{}" }
      },
      j_charcuterie_halley = {
        name = "Halley's Comet",
        text = {
          "For every {C:attention}5{} Hands played,",
          "generate 3 {C:dark_edition}Negative{} {C:planet}Planet Cards{} for your",
          "{C:attention}most played{} hand.",
          "{S:0.7,C:inactive}(currently #1#){}"
        }
      },
      j_charcuterie_hazardsign = {
        name = "Hazard Sign",
        text = {
          "Gains {X:chips,C:white}X#1#{} Chips every time",
          "an {C:charcuterie_unstable}Unstable{} card activates.",
          "{C:inactive,S:0.5}(currently {}{X:chips,C:white,S:0.5}X#2# {}{C:inactive,S:0.5}.)"
        }
      },
      j_charcuterie_interstellar = {
        name = "Interstellar",
        text = { "{C:charcuterie_galactical}Galactical{} cards give {C:mult}+#1#{} Mult." }
      },
      j_charcuterie_juxtaposition = {
        name = "Juxtaposition",
        text = {
          "Remove {C:dark_edition}Negative{} from all Jokers you have,",
          "{C:attention}+1{} Joker Slot every time {C:dark_edition}Negative{} is removed.",
          "{S:0.6,C:inactive}Currently +#1# Joker Slots.{}"
        }
      },
      j_charcuterie_mothership = {
        name = "Mothership",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each",
          "{C:charcuterie_galactical}Galactical{} Card in your {C:attention}Full Deck{}",
          "{S:0.5,C:inactive}(Currently{} {X:mult,C:white,S:0.5}X#2#{}{S:0.5,C:inactive} Mult){}"
        }
      },
      j_charcuterie_pcb = {
        name = "PCB",
        text = { "Copies ability of leftmost", "and rightmost Jokers." }
      },
      j_charcuterie_reactorrod = {
        name = "Reactor Rod",
        text = {
          "{C:charcuterie_unstable}Unstable{} cards now grant {X:mult,C:white}X6{} Mult,",
          "but will now create {C:attention}four{} cards when the effect activates."
        }
      },
      j_charcuterie_schematic = {
        name = "Schematic",
        text = { "Copies ability of", "{C:attention}Joker{} to the left" }
      },
      j_charcuterie_starchild = {
        name = "Starchild",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult for every {C:charcuterie_galactical}Galactical{} Face card played."
        }
      },
      j_charcuterie_subplot = {
        name = "Subplot",
        text = {
          "If a single {C:attention}played card{} does",
          "not score it permanently",
          "gains {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_charcuterie_systemofmessages = {
        name = "System of Messages",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each {C:charcuterie_unstable}Unstable{} card in your {C:attention}full deck.{}",
          "{S:0.5,C:inactive}(Currently {}{S:0.5,X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"
        }
      },
      j_charcuterie_thej = {
        name = "The J",
        text = { "For every joker, gain {X:mult,C:white}X#1#{} Mult." }
      },
      j_charcuterie_theusual = {
        name = "The Usual",
        text = {
          "{X:mult,C:white}X#1#{} Mult when playing",
          "Your most played hand.",
          "{S:0.7,C:inactive}Currently #2#.{}"
        }
      },
      j_charcuterie_virtuous = {
        name = "Virtuous Joker",
        text = {
          "Awards {C:attention}$1{} per {C:charcuterie_purified}Purified{} card",
          "in your full deck at end of round.",
          "{S:0.7,C:inactive}(currently{}{S:0.7,C:attention} $#1#{}{S:0.7,C;inactive}.)"
        }
      },
      j_charcuterie_wargames = {
        name = "War Games",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult for every hand played",
          "not containing an {C:charcuterie_unstable}Unstable{}  card.",
          "{S:0.5,C:inactive}(deck must contain at least 5 unstable cards.){}",
          "{S:0.5,C:inactive}(Currently {}{X:mult,C:white}X#2#{}{S:0.5,C:inactive}.)"
        }
      },
      j_charcuterie_ufo = {
        name = "U.F.O",
        text = { "Turns any face card played into a {C:charcuterie_galactical}Galactical{} Card. " }
      },
      j_charcuterie_boredjoker = {
        name = "Bored Joker",
        text = { "{C:mult}+#1#{} Mult when hand contains a", "{C:attention}#2#{}" }
      },
      j_charcuterie_concretemixer = {
        name = "Concrete Mixer",
        text = { "{C:green}#1# in #2#{} chance to turn a card ", "into a {C:enhanced}Stone Card{}" }
      },
      j_charcuterie_apatheticjoker = {
        name = "Apathetic Joker",
        text = { "{C:chips}+#1#{} Chips when hand contains a", "{C:attention}#2#{}" }
      },
      j_charcuterie_ninetofive = {
        name = "9 to 5",
        text = { "{C:chips}+15{} Chips for every {C:inactive}Suitless{} card", "in your {C:attention}Full Deck.{}" }
      },
      j_charcuterie_porridge = {
        name = "Porridge",
        text = { "{C:inactive}Suitless{} cards give {X:mult,C:white}X2{} Mult", "for {C:attention}#1#{} hands.", "{C:inactive,S:0.5}(#2# hands remaining){}" }
      },
      j_charcuterie_aura = {
        name = "Hype Moments and Aura",
        text = {"Gain {C:attention}$#1#{} at end of round","when score {C:attention}catches aflame{}"}
      },
      j_charcuterie_caption = {
        name = "Caption",
        text = {"Gains {X:mult,C:white}X#1#{} Mult for every","Joker slot {C:attention}above{} 5.","{S:0.7,C:inactive}(currently {}{S:0.7,C:white,X:mult} X#2#{}{S:0.7,C:inactive}.)"}
      },
      j_charcuterie_ambrosia = {
        name = "Ambrosia",
        text = {"Removes {C:red}Cursed{} from scored cards","for {C:attention}#1#{} hands","{C:inactive,S:0.7}( #2# remaining){}"}
      },
      j_charcuterie_potion = {
        name = "Mysterious Potion",
        text = {"When sold, {C:green}#1#%{} chance to duplicate a random {C:attention}Joker{},","{C:red}#2#%{} chance to do {C:attention}nothing{}","{C:inactive,S:0.7}( Removes {}{C:dark_edition,S:0.7}Negative{}{C:inactive,S:0.7} from copy.){}"}
      },
      j_charcuterie_twotime = {
        name = "Two Time",
        text = {"When {C:attention}Blind{} is selected, {C:red}destroy{} Joker to the {C:attention}left{}","and gain {X:black,C:white}x#1#{} Oblation.","If this card has over {X:black,C:white}x#2#{} Oblation, prevents {C:attention}Death{}.","When death is prevented, convert all {X:black,C:white}Oblation{} into {X:mult,C:white}XMult{} and","prevent further {X:black,C:white}Oblation{} gain.","{C:inactive,S:0.7}(Current Oblation: {X:black,C:white}x#3#{C:inactive,S:0.7}.)","{C:inactive,S:0.7}(Current Mult: {X:red,C:white}x#4#{C:inactive,S:0.7}.)"}
      },
      j_charcuterie_ripped = {
        name = "Ripped Joker",
        text = {"Gain {X:mult,C:white}X#1#{} Mult every time","a card is {C:attention}destroyed.{}","{C:inactive,S:0.7}(Currently {X:mult,C:white,S:0.7}X#2#{C:inactive,S:0.7}.)"}
      },
      j_charcuterie_007n7 = {
        name = "007n7",
        text = {"Create a {C:attention}Perishable{} copy of a random Joker","every {C:attention}#1#{} rounds","{C:inactive,S:0.7}({C:attention,S:0.7}#2#{C:inactive,S:0.7} remaining.)"}
      },
      j_charcuterie_c00lkid = {
        name = "C00lkid",
        text = {"Destroy all {C:attention}Perishable{} Jokers when{C:attention} blind{} selected.","Gain {X:chips,C:white}X#1#{} for each Perishable Joker destroyed.","{C:inactive,S:0.7}(Currently {X:chips,C:white,S:0.7}X#2#{C:inactive,S:0.7}.)"}
      },
      j_charcuterie_mafioso = {
        name = "Mafioso",
        text = {"If no {C:attention}Mafia Members{} are present","create #1# {C:attention}Mafia Members{}. {C:inactive,S:0.4}(excludes Mafioso)","Gains {X:mult,C:white}X#2#{} Mult for each {C:attention}Mafia Member{} present.","{C:inactive,S:0.7}(Currently {X:mult,C:white,S:0.7}X#3#{C:inactive,S:0.7}.)"}
      },
      j_charcuterie_made_man = {
        name = "Made Man",
        text = {"Creates an {C:attention}Investment Tag{}","when boss blind {C:attention}defeated{}"}
      },
      j_charcuterie_britalian = {
        name = "Britalian",
        text = {"Stone Cards give {C:attention}$1{} when scored"}
      },
      j_charcuterie_debt_collector = {
        name = "Debt Collector",
        text = {"Gives {C:attention}50%{} of every {C:attention}Joker{}'s sell value combined","at the {C:attention} end of the round.","{C:inactive,S:0.7}(Currently {C:attention,S:0.7}$#1#{C:inactive,S:0.7}.)"}
      },
      j_charcuterie_bunny = {
        name = "Bunny",
        text = {"Sell for a {C:green}#1# in #2#{} chance to","create #3# {C:dark_edition}Negative{} Bunnies."}
      },
      j_charcuterie_mutated = {
        name = "Mutated Joker",
        text = {"played {C:charcuterie_unstable}Unstable Cards{}","have a {C:green}#1#%{} chance of giving {C:attention}$2{}when played","but now has a {C:red}#2#%{} chance of destroying itself."}
      },
      j_charcuterie_cursed_die = {
        name = "Cursed Die",
        text = {"Quadruples all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities",
                    "{C:inactive}(ex: {C:green}1 in 4{C:inactive} -> {C:green}4 in 4{C:inactive})","but locks {C:red}Risk{} to {C:attention}Max{}"}
      },
      j_charcuterie_chance = {
        name = "Chance",
        text = {"{C:green}#1# in #2#{} chance to give {C:attention}$#3#{}","{C:green}#1# in #4#{} chance to {C:red}remove{} {C:chips}#5#{} Chips","{C:green}#1# in #6#{} chance to give {X:mult,C:white}X#6#{} Mult","and {C:attention}$#6#{}"}
      },
      j_charcuterie_buckshot = {
        name = "Buckshot",
        text = {"{C:green}#1# in #2#{} chance to","retrigger every scored card {C:attention}twice{}"}
      },
      j_charcuterie_paranoia = {
        name = "Paranoia",
        text = {"{C:green}#1# in #2#{} chance of","creating a {C:dark_edition}Negative {C:attention}Spectral{} Card when","booster pack opened"}
      },
      j_charcuterie_prank = {
        name = "Innocent Prank",
        text = {"{X:mult,C:white}X#1#{} Mult when","an {C:enhanced}Arc Card{} is scored"}
      },
      j_charcuterie_redqueen = {
        name = "Red Queen",
        text = {"{C:white,X:mult}X#1#{} Mult on last scored card","{C:attention}increases{} by {C:white,X:mult}X#2#{} Mult for","every card scored prior","{C:inactive}(Resets after hand played)"}
      },
      j_charcuterie_aphantasia = {
        name = "Aphantasia",
        text = {"Applies {C:enhanced}Obscured Seal{} to","scored {C:attention}Face Cards{}"}
      },
      j_charcuterie_thinner = {
        name = "Paint Thinner",
        text = {"All {C:enhanced}Wild Cards{}","are considered {C:attention}Suitless{}"}
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
      char_txt_mafia = {
        name = "Mafia Member",
        text = {
          "This card's effects are {C:red}nullified",
          "If your {C:attention}dollars{} are less than 0."
        }
      },


      charcuterie_obscure_seal = {
        name = "Obscured Seal",
        text = {"The card this is applied to","is {C:attention}Rankless{}"}
      },
      charcuterie_lime_seal = {
        name = "Lime Seal",
        text = {"{C:green}#1# in #2#{} chance to","create an {C:charcuterie_unstable}Unstable{} card when scored"}
      },
      charcuterie_brilliant_seal = {
        name = "Brilliant Seal",
        text = {"{C:white,X:chips}X#1#{} Chips if card is {C:enhanced}Enhanced{}."}
      }

    },
    Planet = {
      c_charcuterie_arrakis = {
        name = "Arrakis",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
        }
      },
      c_charcuterie_abafar = {
        name = "Abafar",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
        }
      },
      c_charcuterie_theia = {
        name = "Theia",
        text = {"(lvl. #1#) Level up",
                "{C:attention}#2#{}",
                "{C:mult}+#3#{} Mult and",
                "{C:chips}+#4#{} chips"
        }
      }
    },
    Spectral = {
      c_charcuterie_purge = {
        name = "Purge",
        text = {"Adds {C:dark_edition}Bleached{} to","#1# selected","card in your hand"}
      },
      c_charcuterie_obscura = {
        name = "Obscura",
        text = {"Add a {C:dark_edition}Obscured Seal{}","to {C:attention}#1#{} selected","card in your hand"}
      },
      c_charcuterie_roulette = {
        name = "Roulette",
        text = {
          "{C:green}#1#%{} chance to apply",
          " An {C:enhanced}Edition{} to a random joker,",
          "{C:red}#2#%{} chance to backfire,",
          "{C:red}removing{} an edition from a random joker."
        }
      },
      c_charcuterie_radiance = {}
    },
    Stake = {},
    Tag = {
      tag_charcuterie_meltytag = {
        name = "Melty Tag",
        text = {"Next base edition shop","Joker is free and","becomes {C:dark_edition}Melty{}"}
      }
    },
    Tarot = {
      c_charcuterie_explorer = {
        name = 'The Explorer',
        text = {"Converts #1#","selected cards to","{C:charcuterie_galactical}#2#s{}"}
      },
      c_charcuterie_scientist = {
        name = 'The Scientist',
        text = {"Enhances #1# selected","card into a","{C:charcuterie_unstable}#2#{}"}
      }
    },
    Voucher = {
      v_charcuterie_brimstone = {
        name = "Brimstone",
        text = {
          "Converts one random card",
          "In your {C:attention}full deck{} into",
          "a {C:cursed}Cursed Card every round."
        }
      },
      v_charcuterie_divine = {
        name = "Divine Light",
        text = { "{C:charcuterie_purified}Purifies{} all played {C:charcuterie_cursed}Cursed Cards{}" }
      }
    },
    ritual = {
      c_charcuterie_peer = {
        name = "Peer",
        text = {
          "{C:red}Destroy{} a random joker.",
          "{C:charcuterie_purified}Purify{} 2 selected {C:red}Cursed{} cards."
        }
      },
      c_charcuterie_bloodpact = {
        name = "Blood Pact",
        text = { "Spawn a random {C:red}Eternal Rare{} Joker." }
      },
      c_charcuterie_chippedcoin = {
        name = "Chipped Coin",
        text = {
          "{C:green}#1#%{} chance to {C:attention}double{} money.",
          "{C:red}#2#%{} Chance to backfire and set money to {C:money}$0{} instead."
        }
      },
      c_charcuterie_phase = {
        name = "Phase",
        text = {
          "{C:mult} Destroy{} the {C:attention}Leftmost{} or {C:attention}Rightmost{} Joker.",
          "Add {C:dark_edition}Negative{} to the other."
        }
      },
      
      c_charcuterie_sever = {
        name = "Sever",
        text = { "{C:red}Destroy{} a random Joker.", "Summon 2 {C:red}Ritual Cards{}." }
      },
      c_charcuterie_strike = {
        name = "Strike",
        text = { "{C:red}Curse{} your hand.", "Earn {C:attention}$5{} for every card Cursed." }
      },
      c_charcuterie_summon = {
        name = "Summon",
        text = { "{C:red}Destroy{} 2 random {C:attention}Jokers{}", "{C:green}#1#%{} to create a {C:purple}Legendary{} Joker." }
      },
      c_charcuterie_alchemy = {
        name = "Alchemy",
        text = { "{C:green}#1#%{} chance to make entire hand {C:attention}Gold{}",
                 "{C:red}#2#%{} chance to debuff entire hand instead." }
      },
      c_charcuterie_premonition = {
        name = "Premonition",
        text = {"Ante {C:attention}-1{}","Next Boss Blind is a {C:attention}Showdown{} Blind"}
      }
    },
    Element = {
      c_charcuterie_titanium = {
        name = "Titanium",
        text = { "Converts up to {C:attention}3{}", " selected cards into {C:enhanced}Steel{} Cards" }
      },
      c_charcuterie_plutonium = {
        name = "Plutonium",
        text = { "{C:green}#1#%{} Chance to add {C:charcuterie_unstable}Unstable{}", "to up to {C:attention}2{} selected cards,", "but {C:red}#2#%{} chance to destroy", "selected cards instead." }
      },
      c_charcuterie_neodymium = {
        name = "Neodymium",
        text = { "Make a selected {C:enhanced}Steel Card{} {C:dark_edition}Negative{}" },

      },
      c_charcuterie_zinc = {
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
      ph_two_time = "Saved by Two Time"
    },
    high_scores = {},
    labels = {
      charcuterie_bleached = "Bleached",
      charcuterie_melty = "Melty",
      charcuterie_brilliant_seal = "Brilliant Seal",
      charcuterie_lime_seal = "Lime Seal",
      charcuterie_obscure_seal = "Obscured Seal"
    },
    poker_hands = {
      ['charcuterie_grayflush'] = "Grayscale Flush",
      ['charcuterie_graystraight'] = "Grayscale Straight",
      ['charcuterie_grayhouse'] = "Grayscale House"
    },
    poker_hand_descriptions = {
      ['charcuterie_grayflush'] = {
        "5 Suitless cards",
      },
      ['charcuterie_graystraight'] = {
        "5 Suitless cards (consecutive ranks)"
      },
      ['charcuterie_grayhouse'] = {
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
