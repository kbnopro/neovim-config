---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s(
    {
      trig = "int",
      dscr = "Integral function",
      regTrig = true,
      condition = tex_utils.in_mathzone,
      wordTrig = true,
    },
    fmta(
      [[
      \int_{<>}^{<>} 
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    {
      trig = "dint",
      dscr = "Display integral function",
      regTrig = true,
      condition = tex_utils.in_mathzone,
      wordTrig = true,
    },
    fmta(
      [[
      \int\limits_{<>}^{<>} 
      ]],
      { i(1), i(2) }
    )
  ),
}

return snippets, auto_snippets
