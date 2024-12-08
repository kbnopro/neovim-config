---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s(
    {
      trig = "tbf",
      dscr = "Text bold",
      regTrig = true,
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
      regTrig = true,
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
      regTrig = true,
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

return snippet, autosnippet
