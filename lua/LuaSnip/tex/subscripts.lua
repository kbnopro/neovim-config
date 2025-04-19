---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s(
    {
      trig = "([%a])([%d])",
      dscr = "Auto add subscript",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta([[<>_{<>}]], {
      utils.c(1),
      utils.c(2),
    })
  ),
  s(
    {
      trig = "([%a])_{([%d]+)}([%d]+)",
      dscr = "Auto expand subscripts",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta([[<>_{<><>}]], {
      utils.c(1),
      utils.c(2),
      utils.c(3),
    })
  ),
  s(
    {
      trig = "([%a])_",
      dscr = "Auto expand subscripts",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta([[<>_{<>}]], {
      utils.c(1),
      i(1),
    })
  ),
}

return snippet, autosnippet
