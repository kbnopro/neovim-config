---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s({
    trig = "sr",
    dscr = "Square Root",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[\sqrt{<>}]], { i(1) })),
  s({
    trig = "cr",
    dscr = "Cube Root",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[\sqrt[3]{<>}]], { i(1) })),
  s({
    trig = "([^%a])rr",
    dscr = "Root",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[<>\sqrt[<>]{<>}]], { utils.c(1), i(1), i(2) })),
  s({
    trig = "([%d]+)rr",
    dscr = "Root",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
    priority = 2000,
  }, fmta([[\sqrt[<>]{<>}]], { utils.c(1), i(2) })),
}

return snippet, autosnippet
