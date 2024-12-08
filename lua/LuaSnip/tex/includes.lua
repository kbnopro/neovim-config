---@diagnostic disable: undefined-global

local utils = ls_tracked_dopackage("LuaSnip.utils")
local tex_utils = ls_tracked_dopackage("LuaSnip.tex.utils")

local snippets = {
  s(
    {
      trig = "includepdf",
      dscr = "Include PDF",
    },
    fmta(
      [[
        \begin{center}
          \makebox[\textwidth]{
            \fbox{\includegraphics[page=<>,clip,trim=0 0 0 0,width=0.75\paperwidth]{<>.pdf}}
          } 
        \end{center}
        <>
      ]],
      { i(1), i(2), i(0) }
    )
  ),
}
local auto_snippets = {}

return snippets, auto_snippets
