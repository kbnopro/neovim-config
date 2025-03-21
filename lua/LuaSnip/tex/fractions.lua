---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s({
    trig = "ff",
    dscr = "Fraction",
    regTrig = true,
    wordTrig = true,
    condition = tex_utils.in_mathzone,
  }, fmta([[\frac{<>}{<>}<>]], { utils.v(1), i(2), i(0) })),
  s(
    {
      trig = "(%b())ff",
      dscr = "Fraction after a pair of parentheses",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
      priority = 2000,
    },
    fmta([[\frac{<>}{<>}]], {
      utils.c(1, function(str)
        local str_len = string.len(str)
        return string.sub(str, 2, str_len - 1)
      end),
      i(2),
    })
  ),
  s({
    trig = "dff",
    dscr = "Fraction",
    regTrig = true,
    wordTrig = true,
    condition = tex_utils.in_mathzone,
    priority = 3000,
  }, fmta([[\dfrac{<>}{<>}]], { utils.v(1), i(2) })),
  s(
    {
      trig = "(%b())dff",
      dscr = "Fraction after a pair of parentheses",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
      priority = 4000,
    },
    fmta([[\dfrac{<>}{<>}]], {
      utils.c(1, function(str)
        local str_len = string.len(str)
        return string.sub(str, 2, str_len - 1)
      end),
      i(2),
    })
  ),
}

return snippets, auto_snippets
