---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s(
    {
      trig = "lim",
      dscr = "Limit function",
      regTrig = true,
      condition = tex_utils.in_mathzone,
      wordTrig = true,
    },
    fmta(
      [[
      \lim_{<> \to <>} 
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    {
      trig = "dlim",
      dscr = "Limit function",
      regTrig = true,
      condition = tex_utils.in_mathzone,
      wordTrig = true,
    },
    fmta(
      [[
      \lim\limits_{<> \to <>} 
      ]],
      { i(1), i(2) }
    )
  ),
}

return snippets, auto_snippets
