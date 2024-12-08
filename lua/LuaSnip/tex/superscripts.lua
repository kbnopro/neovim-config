---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippet = {}
local autosnippet = {
  s(
    {
      trig = "([%w])^{([%d]+)}([%d]+)",
      dscr = "Auto expand superscripts",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta([[<>^{<><>}]], {
      utils.c(1),
      utils.c(2),
      utils.c(3),
    })
  ),
  s(
    {
      trig = "tt",
      dscr = "Auto create superscripts",
      regTrig = true,
      wordTrig = false,
      condition = tex_utils.in_mathzone,
    },
    fmta([[^{<>}]], {
      i(1),
    })
  ),
  s({
    trig = "sq",
    dscr = "Square",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[^{2}<>]], { i(0) })),
  s({
    trig = "cb",
    dscr = "Cube",
    regTrig = true,
    wordTrig = false,
    condition = tex_utils.in_mathzone,
  }, fmta([[^{3}<>]], { i(0) })),
}

return snippet, autosnippet
