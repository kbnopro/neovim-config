---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s(
    {
      trig = "ita",
      dscr = "Item in itemize",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_itemize,
    },
    fmta(
      [[
      \item[\textbf{<>}] 
      ]],
      { i(1) }
    )
  ),
  s(
    {
      trig = "itt",
      dscr = "Item in itemize",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_itemize,
    },
    fmta(
      [[
      \item <>
      ]],
      { i(0) }
    )
  ),
}

return snippets, auto_snippets
