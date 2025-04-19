---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s(
    {
      dscr = "Generic environment",
      regTrig = true,
      wordTrig = true,
      trig = "bb",
    },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      <>
    ]],
      {
        i(1),
        utils.v(2),
        rep(1),
        i(0),
      }
    )
  ),
  s(
    {
      dscr = "Inline math environment",
      regTrig = true,
      wordTrig = true,
      condition = tex_utils.in_text,
      trig = "mm",
    },
    fmta(
      [[
        $<>$
      ]],
      {
        utils.v(1),
      }
    )
  ),
  s(
    {
      trig = "dm",
      dscr = "Display math environment",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_text * utils.line_begin,
    },
    fmta(
      [[
        \[ 
          <>
        \]
        <>
      ]],
      { utils.v(1), i(0) }
    )
  ),
  s(
    {
      trig = "al",
      dscr = "Align environment",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_text * utils.line_begin,
    },
    fmta(
      [[
      \begin{align*}
        <>
      \end{align*}
      <>
      ]],
      { i(1), i(0) }
    )
  ),
}

return snippet, autosnippet
