---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {
  s(
    {
      trig = "tbf",
      dscr = "Text bold",
      wordTrig = false,
    },
    fmta(
      [[
      \textbf{<>} 
      ]],
      { utils.v(1) }
    )
  ),
  s(
    {
      trig = "tit",
      dscr = "Text italic",
      wordTrig = false,
    },
    fmta(
      [[
      \textit{<>} 
      ]],
      { utils.v(1) }
    )
  ),
  s(
    {
      trig = "txt",
      dscr = "Text in mathzone",
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      \text{<>} 
      ]],
      { utils.v(1) }
    )
  ),
}

local autosnippet = {}

return snippet, autosnippet
