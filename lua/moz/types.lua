---@class MozColors<T>: { base: T, base_darker: T, accent: T, highlight: T, green: T, yellow: T, blue: T, red: T, purple: T, orange: T, cyan: T, gray: T, white: T, error: T, base: T, base_darker: T, accent: T, highlight: T }

---@class MozOptions
---@field color_overrides MozColors?
---@field highlight_overrides MozHighlightOverrides?
---@field custom_highlights MozHighlightOverrides | { [string]: MozHighlight } | nil
---@field integrations MozIntegrations?
---@field transparent_background boolean?
---@field dim_inactive boolean?
---@field show_end_of_buffer boolean?
---@field styles MozStyles?
---@field compile boolean?

---@alias MozHighlightOverrides fun(colors: MozColors<string>): { [string]: MozHighlight }
---@alias MozHighlightArgs "bold" | "underline" | "undercurl" | "underdouble" | "underdotted" | "underdashed" | "strikethrough" | "reverse" | "inverse" | "italic" | "standout" | "altfont" | "nocombine" | "NONE"

---@class MozStyles
---@field comments MozHighlightArgs[]?
---@field conditionals MozHighlightArgs[]?
---@field loops MozHighlightArgs[]?
---@field functions MozHighlightArgs[]?
---@field keywords MozHighlightArgs[]?
---@field strings MozHighlightArgs[]?
---@field variables MozHighlightArgs[]?
---@field numbers MozHighlightArgs[]?
---@field booleans MozHighlightArgs[]?
---@field properties MozHighlightArgs[]?
---@field types MozHighlightArgs[]?
---@field operators MozHighlightArgs[]?
---@field miscs MozHighlightArgs[]?

---@class MozIntegrations
---@field alpha boolean?
---@field telescope boolean?
---@field treesitter boolean?
---@field treesitter_context boolean?
---@field cmp boolean?
---@field mason boolean?
---@field neotree boolean?
---@field gitsigns boolean?
---@field which_key boolean?

---@class MozHighlight
---@field fg string?
---@field bg string?
---@field style MozHighlightOverrides[]?
---@field link string?
