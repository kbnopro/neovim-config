return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["<C-l>"] = { false },
      ["<C-h>"] = { false },
    },
  },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
