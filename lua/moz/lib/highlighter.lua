local M = {}

---@param config MozConfig
---@param colors MozColors
function M.setup(config, colors)
	local highlights = {}

	for _, highlight in ipairs({ "editor", "syntax", "terminal" }) do
		local mod = require("moz.highlights." .. highlight)

		for hl, spec in pairs(mod.apply(config, colors)) do
			highlights[hl] = spec
		end
	end

	for integration in pairs(config.integrations) do
		if config.integrations[integration] == true then
			local mod = require("moz.highlights.integrations." .. integration)

			for hl, spec in pairs(mod.apply(config, colors)) do
				highlights[hl] = spec
			end
		end
	end

	for hl, spec in pairs(config.highlight_overrides(colors)) do
		if highlights[hl] and next(spec) then
			highlights[hl].link = nil
		end

		highlights[hl] = vim.tbl_extend("force", highlights[hl] or {}, spec)
	end

	return highlights
end

---@param highlights table
function M.apply(highlights)
	for hl, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, hl, spec)
	end
end

return M
