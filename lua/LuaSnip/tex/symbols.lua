---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {}
local auto_snippets = {
  s({
    trig = "([^%a])ap",
    dscr = "Approach symbol",
    regTrig = true,
    wordTrig = false,
  }, fmta("<>\\rightarrow ", { utils.c(1) })),
  s({
    trig = "approx",
    dscr = "Approximate symbol",
    regTrig = true,
    wordTrig = true,
  }, fmta("<>\\approx ", { utils.c(1) })),
  s({
    trig = "([^%a])iff",
    dscr = "Equivalent symbols",
    regTrig = true,
    condition = tex_utils.in_mathzone,
    wordTrig = false,
  }, fmta("<>\\Leftrightarrow ", { utils.c(1) })),
  s({
    trig = "([^%a])ip",
    dscr = "Double right arrow",
    regTrig = true,
    condition = tex_utils.in_mathzone,
    wordTrig = false,
  }, fmta("<>\\Rightarrow ", { utils.c(1) })),
  s({
    trig = "\\\\",
    dscr = "Auto go to newline after end of line symbol",
    regTrig = true,
    wordTrig = false,
  }, t({ "\\\\", "" })),
  s({
    trig = "\\0",
    dscr = "Empty set symbol (assymb package required)",
    regTrig = true,
    wordTrig = true,
  }, t("\\varnothing")),
  s({
    trig = "inf",
    dscr = "Infinity symbol",
    regTrig = true,
    wordTrig = true,
  }, t("\\infty ")),
  s({
    trig = "equiv",
    dscr = "Equivalent symbol (for modulus)",
    regTrig = true,
    wordTrig = true,
  }, t("\\equiv ")),
  s({
    trig = "fral",
    dscr = "For all symbol",
    regTrig = true,
    wordTrig = true,
  }, t("\\forall ")),
  s({
    trig = "exi",
    dscr = "Exist symbol",
    regTrig = true,
    wordTrig = true,
  }, t("\\exists ")),
  s({
    trig = "([^%a])mbb",
    dscr = "Mathematical number set symbol",
    regTrig = true,
    wordTrig = false,
  }, fmta("<>\\mathbb{<>} ", { utils.c(1), i(1) })),
}

return snippets, auto_snippets
