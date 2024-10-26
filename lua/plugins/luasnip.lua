return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    opts = {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      update_events = "TextChanged,TextChangedI",
    },
    init = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "nvim-cmp",
  -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
}
