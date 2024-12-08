---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  ms(
    {
      common = {
        dscr = "Generic environment",
        regTrig = true,
        wordTrig = false,
      },
      { trig = "^bb" },
      { trig = "([^%a^%s])bb" },
    },
    fmta(
      [[
      <>\begin{<>}
        <>
      \end{<>}
      <>
    ]],
      {
        utils.c(1),
        i(1),
        utils.v(2),
        rep(1),
        i(0),
      }
    )
  ),
  s(
    {
      dscr = "Generic environment",
      regTrig = true,
      wordTrig = false,
      trig = "([%s])bb",
    },
    fmta(
      [[
      <>\begin{<>}
      <>  <>
      <>\end{<>}
      <><>
    ]],
      {
        utils.c(1),
        i(1),
        utils.c(1),
        utils.v(2),
        utils.c(1),
        rep(1),
        utils.c(1),
        i(0),
      }
    )
  ),
  ms(
    {
      common = {
        dscr = "Inline math environment",
        regTrig = true,
        wordTrig = false,
        condition = tex_utils.in_text,
      },
      {
        trig = "^mm",
      },
      {
        trig = "([^%a])mm",
      },
    },
    fmta(
      [[
        <>$<>$
      ]],
      {
        utils.c(1),
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
