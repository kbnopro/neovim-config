---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local auto_snippet = {}
local snippet = {
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
  s(
    {
      trig = "matrix",
      dscr = "Matrix",
      wordTrig = true,
      condition = tex_utils.in_mathzone,
      show_condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      \begin{bmatrix}\end{bmatrix} <>
      ]],
      { i(0) }
    )
  ),
  s(
    {
      trig = "\\begin{bmatrix}\\end{bmatrix} ([%d])([%d])",
      dscr = "Matrix",
      regTrig = true,
      wordTrig = true,
      snippetType = "autosnippet",
      condition = tex_utils.in_mathzone,
    },
    fmta(
      [[
      \begin{bmatrix}
        <>
      \end{bmatrix}
      ]],
      {
        d(1, function(_, parent)
          local n = tonumber(parent.captures[1])
          local m = tonumber(parent.captures[2])
          local snip = {}
          for a = 1, n do
            for b = 1, m do
              table.insert(snip, i(b + (a - 1) * m))
              if b ~= m then
                table.insert(snip, t(" & "))
              end
            end
            if a ~= n then
              table.insert(snip, t({ "\\\\", "\t" }))
            end
          end
          return sn(nil, snip)
        end),
      }
    )
  ),
}

return snippet, auto_snippet
