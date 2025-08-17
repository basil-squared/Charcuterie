local get_joker_to_right = function(jokers,card)
	local index
	for i=1, #jokers do
		if jokers[i] == card then
			index = i + 1

		end

	end
	return index or 0
end


SMODS.Joker {
    key = 'alien_hominid',
    atlas = CHAR.G.jokeratlas2.key,
    pos = { x = 1, y = 0 },
    config = { extra = { curr_mult = 1, increm = 0.1, base = 1 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.increm,card.ability.extra.curr_mult}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.jokers.cards[get_joker_to_right(G.jokers.cards, card)] ~= 0 then
                local sel_card = G.jokers.cards[get_joker_to_right(G.jokers.cards, card)]
                local curr_sell = sel_card.sell_cost
                local num_galac = CHAR.FUNC.check_enhancement_deck('m_charcuterie_galactical')
                card.ability.extra.curr_mult = ((num_galac * card.ability.extra.increm) + card.ability.extra.base) *
                curr_sell
                SMODS.destroy_cards(sel_card)
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.curr_mult
            }
        end
    end
}