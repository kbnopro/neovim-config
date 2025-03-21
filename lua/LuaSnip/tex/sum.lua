---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s({
    trig = "sum",
    dscr = "Auto expand superscripts",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[\sum_{<>}^{<>}]], { i(1), i(2) })),
  s({
    trig = "dsum",
    dscr = "Auto expand superscripts",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
    priority = 2000,
  }, fmta([[\sum\limits_{<>}^{<>}]], { i(1), i(2) })),
}

return snippet, autosnippet
