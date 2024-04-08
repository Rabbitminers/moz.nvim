local M = {}

---@param config MozConfig
---@param colors MozColors
function M.apply(config, colors)
	return {
		ColorColumn = { bg = colors.base },                                                               -- used for the columns set with 'colorcolumn'
		Conceal = { fg = colors.gray },                                                                   -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = colors.base, bg = colors.white },                                                 -- character under the cursor
		lCursor = { fg = colors.base, bg = colors.white },                                                -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = colors.base, bg = colors.white },                                               -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = colors.base },                                                              -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = colors.highlight },                                                           -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
		Directory = { fg = colors.blue },                                                                 -- directory names (and other special names in listings)
		EndOfBuffer = { fg = config.show_end_of_buffer and colors.accent or colors.base },                -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = colors.red, style = { "bold", "italic" } },                                     -- error messages on the command line
		VertSplit = { fg = config.transparent_background and colors.accent or colors.base },              -- the column separating vertically split windows
		Folded = { fg = colors.blue, bg = config.transparent_background and colors.none or colors.accent }, -- line used for closed folds
		FoldColumn = { fg = colors.gray },                                                                -- 'foldcolumn'
		SignColumn = { fg = colors.accent },                                                              -- column where |signs| are displayed
		SignColumnSB = { bg = colors.base, fg = colors.accent },                                          -- column where |signs| are displayed
		Substitute = { bg = colors.accent, fg = colors.red },                                             -- |:substitute| replacement text highlighting
		LineNr = { fg = colors.accent },                                                                  -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = colors.purple },                                                            -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
		MatchParen = { fg = colors.orange, bg = colors.accent, style = { "bold" } },                      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = colors.white, style = { "bold" } },                                              -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgSeparator = {},                                                                                -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = colors.blue },                                                                   -- |more-prompt|
		NonText = { fg = colors.gray },                                                                   -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = colors.white, bg = config.transparent_background and colors.none or colors.base }, -- normal text
		NormalNC = {
			fg = colors.white,
			bg = (config.transparent_background and config.dim_inactive and colors.base_darker)
					or (config.dim_inactive and colors.base_darker)
					or (config.transparent_background and colors.none)
					or colors.base,
		},                                                -- normal text in non-current windows
		NormalSB = { fg = colors.white, bg = colors.base }, -- normal text in non-current windows
		NormalFloat = {
			fg = colors.white,
			bg = (config.transparent_background and vim.o.winblend == 0) and colors.none or colors.base,
		},                                -- Normal text in floating windows.
		FloatBorder = { fg = colors.blue },
		FloatTitle = { fg = colors.white }, -- Title of floating windows
		Pmenu = {
			bg = (config.transparent_background and vim.o.pumblend == 0) and colors.none or colors.base,
			fg = colors.gray,
		},                                                                                                      -- Popup menu: normal item.
		PmenuSel = { bg = colors.accent, style = { "bold" } },                                                  -- Popup menu: selected item.
		PmenuSbar = { bg = colors.accent },                                                                     -- Popup menu: scrollbar.
		PmenuThumb = { bg = colors.gray },                                                                      -- Popup menu: Thumb of the scrollbar.
		Question = { fg = colors.blue },                                                                        -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = colors.accent, style = { "bold" } },                                              -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = colors.base },                                                                          -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = colors.base },                                                                       -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { bg = colors.red, fg = colors.base },                                                      -- 'cursearch' highlighting: highlights the current search you're on differently
		SpecialKey = { link = "NonText" },                                                                      -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
		SpellBad = { sp = colors.red, style = { "undercurl" } },                                                -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = colors.yellow, style = { "undercurl" } },                                             -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = colors.blue, style = { "undercurl" } },                                             -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = colors.green, style = { "undercurl" } },                                             -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = colors.white, bg = config.transparent_background and colors.none or colors.base },  -- status line of current window
		StatusLineNC = { fg = colors.accent, bg = config.transparent_background and colors.none or colors.base }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = colors.base, fg = colors.accent },                                                     -- tab pages line, not active tab page label
		TabLineFill = {},                                                                                       -- tab pages line, where there are no labels
		TabLineSel = { fg = colors.green, bg = colors.accent },                                                 -- tab pages line, active tab page label
		Title = { fg = colors.blue, style = { "bold" } },                                                       -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = colors.accent, style = { "bold" } },                                                    -- Visual mode selection
		VisualNOS = { bg = colors.accent, style = { "bold" } },                                                 -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = colors.yellow },                                                                    -- warning messages
		Whitespace = { fg = colors.accent },                                                                    -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = colors.base },                                                                        -- current match in 'wildmenu' completion
		WinBar = { fg = colors.red },
		WinBarNC = { link = "WinBar" },
		WinSeparator = { fg = config.transparent_background and colors.accent or colors.base },
	}
end

return M
