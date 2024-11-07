-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Create undo checkpoint before expanding luasnip's snippet
vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipPreExpand",
  callback = function()
    vim.o.undolevels = vim.o.undolevels
  end,
})
