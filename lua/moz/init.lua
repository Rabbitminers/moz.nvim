local M = {}

---@class MozConfig
M.config = {
	color_overrides = {},
	custom_highlights = function()
		return {}
	end,
	integrations = {
		alpha = false,
		cmp = false,
		gitsigns = false,
		neotree = false,
		treesitter = false,
		treesitter_context = false,
	},
	dim_inactive = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	show_end_of_buffer = false,
	transparent_background = false,
	compile = false,
}

---@param config MozConfig
function M.setup(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

function M.load()
	vim.g.colors_name = "moz"
	vim.o.termguicolors = true

	if M.config.compile then
		local compiler = require("moz.lib.compiler")

		if compiler.load() then
			return
		end

		M.compile()
		compiler.load()
	else
		local colors = require("moz.colors").setup(M.config)
		local highlights = require("moz.lib.highlighter").setup(M.config, colors)

		require("moz.lib.highlighter").apply(highlights)
	end
end

function M.compile()
	local colors = require("moz.colors").setup(M.config)
	local highlights = require("moz.lib.highlighter").setup(M.config, colors)

	require("moz.lib.highlighter").apply(highlights)
end

vim.api.nvim_create_user_command("MozCompile", function()
	for mod, _ in pairs(package.loaded) do
		if mod:match("^moz%.") then
			package.loaded[mod] = nil
		end
	end

	M.compile()
	vim.notify("Moz: compiled successfully", vim.log.levels.INFO)

	M.load()
	vim.api.nvim_exec_autocmds("colorscheme", { modeline = false })
end, {})

return M
