---@diagnostic disable: undefined-global

local make_condition = require("luasnip.extras.conditions").make_condition

local utils = {}

utils.in_mathzone = make_condition(function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end)

utils.in_text = make_condition(function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end)

utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

utils.in_itemize = make_condition(function()
  return utils.in_env("itemize")
end)

return utils
