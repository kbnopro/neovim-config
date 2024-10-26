return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.latex_view_general_view = "zathura_simple"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_conceal = "abdmg"
      vim.opt.conceallevel = 1
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 1,
        styles = 1,
      }
    end,
  },
}
