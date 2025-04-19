---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s({
    dscr = "Vector",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
    trig = "([%a]?_?{?[0-9]*}?^?{?[0-9]*}?),%.",
  }, fmta([[\vec{<>}]], { utils.c(1) })),
  s({
    dscr = "Vector",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
    trig = "([%a]?_?{?[0-9]*}?^?{?[0-9]*}?)%.,",
  }, fmta([[\vec{<>}]], { utils.c(1) })),
}

return snippet, autosnippet
