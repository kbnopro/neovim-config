return {
  "neovim/nvim-lspconfig",
  opts = {
    ---@types lspconfig.options
    servers = {
      eslint = {
        settings = {
          options = {
            flags = { "unstable_ts_config" },
          },
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
          if client.server_capabilities.documentFormattingProvider then
            local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*",
              callback = function()
                vim.lsp.buf.format()
              end,
              group = au_lsp,
            })
          end
        end)
      end,
    },
  },
}