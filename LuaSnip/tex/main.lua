local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, { t(parent.snippet.env.LS_SELECT_RAW) })
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local function capt(pos)
  return function(_, snip)
    return snip.captures[pos]
  end
end

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local not_in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

local in_itemize = function() -- itemize environment detection
  return in_env("itemize")
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s(
    {
      dscr = "A LaTex environment",
      snippetType = "autosnippet",
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
        i(2),
        rep(1),
        i(0),
      }
    )
  ),
  ms(
    {
      common = {
        dscr = "A LaTex environment",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
      },
      {
        trig = "^([%s]*)mm",
      },
      {
        trig = "([^%w])mm",
      },
    },
    fmta(
      [[
        <>$<>$
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        d(1, get_visual),
      }
    )
  ),
  s(
    { trig = "dm", dscr = "Display Math", snippetType = "autosnippet", regTrig = true, wordTrig = false },
    fmta(
      [[
        \[ 
          <>
        \]
        <>
      ]],
      { i(1), i(0) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "([%a])([%d])", dscr = "Subscript 1", snippetType = "autosnippet", regTrig = true, wordTrig = false },
    fmta([[<>_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "([%a])_{([%d]+)}([%d]+)",
      dscr = "Subscript",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta([[<>_{<><>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      f(function(_, snip)
        return snip.captures[3]
      end),
    }),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "([%w])^{([%d]+)}([%d]+)",
      dscr = "Superscript",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta([[<>^{<><>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      f(function(_, snip)
        return snip.captures[3]
      end),
    }),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "td",
      dscr = "Superscript",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta([[^{<>}]], {
      i(1),
    }),
    { condition = in_mathzone }
  ),
  s({
    trig = "sq",
    dscr = "Square",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[^{2}<>]], { i(0) }), { condition = in_mathzone }),
  s({
    trig = "cb",
    dscr = "Cube",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[^{3}<>]], { i(0) }), { condition = in_mathzone }),
  s({
    trig = "sr",
    dscr = "Square Root",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[\sqrt{<>}]], { i(1) }), { condition = in_mathzone }),
  s({
    trig = "cr",
    dscr = "Cube Root",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[\sqrt[3]{<>}]], { i(1) }), { condition = in_mathzone }),
  s({
    trig = "dt",
    dscr = "Root",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[\sqrt[<>]{<>}]], { i(1), i(2) }), { condition = in_mathzone }),
  s({
    trig = "ff",
    dscr = "Fraction",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = false,
  }, fmta([[\frac{<>}{<>}]], { d(1, get_visual), i(2) }), { condition = in_mathzone }),
  s(
    {
      trig = "all",
      dscr = "Aligned with { at the beginning",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = true,
    },
    fmta(
      [[
        \left\{\begin{aligned}
          <>
        \end{aligned}\right.<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "alt",
      dscr = "Top aligned",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta(
      [[
        \begin{aligned}[t]
          <>
        \end{aligned}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = ";ar",
      dscr = "Two collumn array",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta(
      [[
      \arraycolsep=15pt
      \begin{array}{ll}
        <>
      \end{array}
    ]],
      { i(1) }
    )
  ),
  s(
    {
      trig = "bf",
      dscr = "Text bf",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta(
      [[
      \textbf{<>}\quad 
      ]],
      { d(1, get_visual) }
    )
  ),
  s(
    {
      trig = "ita",
      dscr = "Item in itemize",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta(
      [[
      \item[\cmss <>] 
      ]],
      { i(1) }
    ),
    { condition = in_itemize }
  ),
  s({
    trig = "lr",
    dscr = "Arrow",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = true,
  }, t("\\Leftrightarrow "), { condition = in_mathzone }),
  s({
    trig = "ra",
    dscr = "Arrow",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = true,
  }, t("\\Rightarrow "), { condition = in_mathzone }),
  s({
    trig = "ln",
    dscr = "Item in itemize",
    snippetType = "autosnippet",
    regTrig = true,
    wordTrig = true,
  }, t({ "\\\\", "" })),
  s(
    {
      trig = "al",
      dscr = "Text bf",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
    },
    fmta(
      [[
      \begin{align*}
        <>
      \end{align*}
      <>
      ]],
      { i(1), i(0) }
    ),
    {
      condition = function()
        return not_in_mathzone() and line_begin
      end,
    }
  ),
}
