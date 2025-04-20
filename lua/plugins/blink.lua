return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-p>"] = { "fallback_to_mappings" },
      ["<C-n>"] = { "fallback_to_mappings" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
    },
  },
}
