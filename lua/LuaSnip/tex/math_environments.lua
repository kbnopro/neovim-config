---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local auto_snippet = {
  s(
    {
      trig = "all",
      dscr = "Aligned with { at the beginning",
      regTrig = true,
      wordTrig = true,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
        \left\{\begin{aligned}
          <>
        \end{aligned}\right.<>
      ]],
      { utils.vi(1), i(0) }
    )
  ),
  s(
    {
      trig = "alt",
      dscr = "Top aligned",
      regTrig = true,
      wordTrig = false,
      condtion = tex_utils.in_mathzone,
    },
    fmta(
      [[
        \begin{aligned}[t]
          <>
        \end{aligned}<>
      ]],
      { utils.vi(1), i(0) }
    )
  ),
  s(
    {
      trig = "arr",
      dscr = "Array",
      regTrig = true,
      wordTrig = true,
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      \arraycolsep=15pt
      \begin{array}{<>}
        <>
      \end{array}
    ]],
      { i(1), i(2) }
    )
  ),
}

return snippet, auto_snippet
