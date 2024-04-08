---@class PaletteColors
local palette = {
	base = "#212121",
	base_darker = "#1A1A1A",
	accent = "#323232",
	highlight = "#3f3f3f",

	green = "#c3e88d",
	yellow = "#ffcb6b",
	blue = "#82aaff",
	red = "#f07178",
	purple = "#c792ea",
	orange = "#f78c6c",
	cyan = "#89ddff",
	gray = "#616161",
	white = "#eeffff",
	error = "#ff5370",
}

local M = {}

---@param config MozConfig?
function M.setup(config)
	config = config or {}

	local override_colors = config.color_overrides or require("moz").config.color_overrides
	local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

	updated_palette_colors.none = "NONE"

	return updated_palette_colors
end

return M
