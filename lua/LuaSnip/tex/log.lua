---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s(
    {
      trig = "([^%a])lg",
      dscr = "Logarite function",
      regTrig = true,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      <>\log_{<>} 
      ]],
      { utils.c(1), i(1) }
    )
  ),
  s({
    trig = "([^%a])ln",
    dscr = "Natural log function",
    regTrig = true,
    condition = tex_utils.in_mathzone,
  }, fmta([[<>\ln]], utils.c(1))),
}

return snippets, auto_snippets
