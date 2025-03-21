-- Load snippets in LuaSnip

return {
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      vim.api.nvim_create_user_command("LuaSnipEdit", function()
        require("luasnip.loaders").edit_snippet_files()
      end, {})
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/LuaSnip/" } })
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        update_events = { "TextChanged", "TextChangedI" },
      })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
