function CHAR.FUNC.recursive_apply_num(table, modi, op, visited)
	visited = visited or {}
	if type(table) ~= "table" then return table end
	if visited[table] then return table end
	visited[table] = true

	for k, v in pairs(table) do
		local current_value = table[k]

		if type(current_value) == "table" then

			CHAR.FUNC.recursive_apply_num(current_value, modi, op, visited)
		elseif type(current_value) == "number" then

			local is_old_key = type(k) == "string" and k:find("^old_")
			if not is_old_key then
				table['old_' .. tostring(k)] = current_value
				table[k] = CHAR.FUNC.op(op, current_value, modi)
			end
		end
	end
	return table
end



function CHAR.FUNC.change_card_values(card,mod,operation,reset)


	-- OBJECTIVES --
	--[[ the conventionally changable card values are stored in config, or ability.
	I'd rather use ability as that's going to ensure the values are reset when the run is.
	I need to 'scan' ability for certain values, throw out the base game ones that have no influence on how the card actually works,
	then change them through mod, and 'save' the original values for later reapplication. Perhaps by prefixing the original values with old_?
	so I need to save the card's ability table temporarily, probably manually check for things that all cards have, then only change the leftovers,
	then finally tack it back onto the card.
	]]
	local old_table
	if card and card.ability and card.ability.extra then
		old_table = card.ability

	else
		return
	end
	if reset then
		if type(old_table.extra) == 'table' and old_table.extra.flag then

			local curr_val = {}

			for k, v in pairs(old_table.extra) do
				if not k:find("^" .. "old_") and type(old_table.extra[k]) == 'number' then
					curr_val[k] = v

				end
			end
			for k,v in pairs(curr_val) do
				old_table.extra[k] = old_table.extra["old_"  .. k]
			end
			old_table.extra.flag = nil
			return old_table
			else if type(old_table.extra) == 'number' then
			if old_table.old_extra then
				old_table.extra = old_table.old_extra
				return old_table.extra
			end

		end
		end

	end
	if old_table.extra.oc_incompatible then
		return old_table
	end
	if type(old_table.extra) == "table" and not old_table.extra.flag then
		old_table.extra = CHAR.FUNC.recursive_apply_num(old_table.extra,mod,operation)
		old_table.extra.flag = true
		return old_table

		else if type(old_table.extra) == 'number' then
			old_table.old_extra = old_table.extra
			old_table.extra = CHAR.FUNC.op(operation,old_table.extra,mod)
			return old_table

	end

	end
end