---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s(
    {
      trig = "log",
      dscr = "Logarite function",
      wordTrig = true,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      <>\log_{<>} 
      ]],
      { utils.c(1), i(1) }
    )
  ),
  s(
    {
      trig = "ln",
      dscr = "Logarite function",
      wordTrig = true,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      \log 
      ]],
      {}
    )
  ),
}

return snippets, auto_snippets
