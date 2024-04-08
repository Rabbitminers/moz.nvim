local M = {}

local PATH_SEP = vim.loop.os_uname().version:match("Windows") and "\\" or "/"
local DIR_PERMISSIONS = 448

local BASE_PATH = vim.fn.stdpath("state") .. PATH_SEP .. "moz"

---@param highlights table
function M.compile(highlights)
	vim.loop.fs_mkdir(BASE_PATH, DIR_PERMISSIONS)

	local file_name = BASE_PATH .. PATH_SEP .. "moz_compiled.lua"
	local file, err = io.open(file_name, "wb")

	if not file or err then
		vim.notify("Moz: Error writing " .. file_name .. ": " .. err, vim.log.levels.ERROR)
		return
	end

	local lines = {
		"require 'moz'.compiled = string.dump(function()",
		"local g = vim.g",
		"local nvim_set_hl = vim.api.nvim_set_hl",
	}

	local inspect = vim.inspect

	for hl, spec in pairs(highlights) do
		if next(spec) then
			table.insert(lines, ('nvim_set_hl(0, "%s", %s)'):format(hl, inspect(spec):gsub("%s", "")))
		end
	end

	table.insert(lines, "end)")

	local blob = table.concat(lines, "\n")
	assert(loadstring(blob, "=(compile)"))()
	file:write(require("moz").compiled)
	file:close()
end

--@return boolean status
function M.load()
	local file_name = BASE_PATH .. PATH_SEP .. "moz_compiled.lua"
	local blob = loadfile(file_name)

	if blob then
		blob()
		return true
	end

	return false
end

return M
