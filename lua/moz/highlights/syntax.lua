local M = {}

---@param config MozConfig
---@param colors MozColors
function M.apply(config, colors)
  return {
    Comment = { fg = colors.gray, style = config.styles.comments },               -- just comments
    SpecialComment = { link = "Special" },                                        -- special things inside a comment
    Constant = { fg = colors.orange },                                            -- (preferred) any constant
    String = { fg = colors.green, style = config.styles.strings or {} },          -- a string constant: "this is a string"
    Character = { fg = colors.cyan },                                             --  a character constant: 'c', '\n'
    Number = { fg = colors.orange, style = config.styles.numbers or {} },         --   a number constant: 234, 0xff
    Float = { link = "Number" },                                                  --    a floating point constant: 2.3e10
    Boolean = { fg = colors.orange, style = config.styles.booleans or {} },       --  a boolean constant: TRUE, false
    Identifier = { fg = colors.purple, style = config.styles.variables or {} },   -- (preferred) any variable name
    Function = { fg = colors.blue, style = config.styles.functions or {} },       -- function name (also: methods for classes)
    Statement = { fg = colors.purple },                                           -- (preferred) any statement
    Conditional = { fg = colors.purple, style = config.styles.conditionals or {} }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = colors.purple, style = config.styles.loops or {} },           --   for, do, while, etc.
    Label = { fg = colors.blue },                                                 --    case, default, etc.
    Operator = { fg = colors.cyan, style = config.styles.operators or {} },       -- "sizeof", "+", "*", etc.
    Keyword = { fg = colors.purple, style = config.styles.keywords or {} },       --  any other keyword
    Exception = { fg = colors.purple, style = config.styles.keywords or {} },     --  try, catch, throw

    PreProc = { fg = colors.purple },                                             -- (preferred) generic Preprocessor
    Include = { fg = colors.purple, style = config.styles.keywords or {} },       --  preprocessor #include
    Define = { link = "PreProc" },                                                -- preprocessor #define
    Macro = { fg = colors.purple },                                               -- same as Define
    PreCondit = { link = "PreProc" },                                             -- preprocessor #if, #else, #endif, etc.

    StorageClass = { fg = colors.yellow },                                        -- static, register, volatile, etc.
    Structure = { fg = colors.yellow },                                           --  struct, union, enum, etc.
    Special = { fg = colors.purple },                                             -- (preferred) any special symbol
    Type = { fg = colors.yellow, style = config.styles.types or {} },             -- (preferred) int, long, char, etc.
    Typedef = { link = "Type" },                                                  --  A typedef
    SpecialChar = { link = "Special" },                                           -- special character in a constant
    Tag = { fg = colors.purple, style = { "bold" } },                             -- you can use CTRL-] on this
    Delimiter = { fg = colors.gray },                                             -- character that needs attention
    Debug = { link = "Special" },                                                 -- debugging statements

    Underlined = { style = { "underline" } },                                     -- (preferred) text that stands out, HTML links
    Bold = { style = { "bold" } },
    Italic = { style = { "italic" } },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = colors.red },                                       -- (preferred) any erroneous construct
    Todo = { bg = colors.purple, fg = colors.base, style = { "bold" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { fg = colors.yellow },
    qfFileName = { fg = colors.blue },
    htmlH1 = { fg = colors.purple, style = { "bold" } },
    htmlH2 = { fg = colors.blue, style = { "bold" } },
    -- mkdHeading = { fg = colors.orange, style = { "bold" } },
    -- mkdCode = { bg = C.terminal_black, fg = colors.white },
    mkdCodeDelimiter = { bg = colors.base, fg = colors.white },
    mkdCodeStart = { fg = colors.purple, style = { "bold" } },
    mkdCodeEnd = { fg = colors.purple, style = { "bold" } },
    -- mkdLink = { fg = colors.blue, style = { "underline" } },

    -- debugging
    debugPC = { bg = config.transparent_background and colors.none or colors.base }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = colors.base, fg = colors.gray },                      -- used for breakpoint colors in terminal-debug
    -- illuminate
    illuminatedWord = { bg = colors.accent },
    illuminatedCurWord = { bg = colors.accent },
    -- diff
    diffAdded = { fg = colors.green },
    diffRemoved = { fg = colors.red },
    diffChanged = { fg = colors.blue },
    diffOldFile = { fg = colors.yellow },
    diffNewFile = { fg = colors.orange },
    diffFile = { fg = colors.blue },
    diffLine = { fg = colors.gray },
    diffIndexLine = { fg = colors.cyan },
    DiffAdd = { bg = colors.green }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = colors.blue }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = colors.red }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = colors.white }, -- diff mode: Changed text within a changed line |diff.txt|
    -- NeoVim
    healthError = { fg = colors.red },
    healthSuccess = { fg = colors.cyan },
    healthWarning = { fg = colors.yellow },
    -- misc

    -- glyphs
    GlyphPalette1 = { fg = colors.red },
    GlyphPalette2 = { fg = colors.cyan },
    GlyphPalette3 = { fg = colors.yellow },
    GlyphPalette4 = { fg = colors.blue },
    GlyphPalette6 = { fg = colors.cyan },
    GlyphPalette7 = { fg = colors.white },
    GlyphPalette9 = { fg = colors.red },

    -- rainbow
    rainbow1 = { fg = colors.red },
    rainbow2 = { fg = colors.orange },
    rainbow3 = { fg = colors.yellow },
    rainbow4 = { fg = colors.green },
    rainbow5 = { fg = colors.blue },
    rainbow6 = { fg = colors.purple },
  }
end

return M
