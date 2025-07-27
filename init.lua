-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("set textwidth=0")
vim.cmd("set wrapmargin=0")
vim.cmd("set wrap")
vim.cmd("set linebreak")

--TODO: Try to keep the progress while still disabling the annoying ltex messages
--https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#lsp-messages
--
--FIX: Maybe bug report this as it doesn't work

require("noice").setup({
  lsp = { progress = { enabled = false } },
})

local null_ls_token = nil
local ltex_token = nil

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  local value = result.value
  if not value.kind then
    return
  end

  local client_id = ctx.client_id
  local name = vim.lsp.get_client_by_id(client_id).name

  if name == "null-ls" then
    if result.token == null_ls_token then
      return
    end
    if value.title == "formatting" then
      null_ls_token = result.token
      return
    end
  end

  if name == "ltex" then
    if result.token == ltex_token then
      return
    end
    if value.title == "Checking document" then
      ltex_token = result.token
      return
    end
  end
end
