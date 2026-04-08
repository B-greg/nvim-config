if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.rust", lazy = true },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  --  { import = "astrocommunity.completion.copilot-lua-cmp" },
  --  This plugin allow to move lines of code with <A-h> <A-j>
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.pack.dart", lazy = true },
  { import = "astrocommunity.pack.java", lazy = true },
  { import = "astrocommunity.pack.python", lazy = true },
  { import = "astrocommunity.pack.typescript", lazy = true },
  { import = "astrocommunity.pack.go", lazy = true },
  { import = "astrocommunity.pack.helm", lazy = true },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.git.blame-nvim", lazy = true },
  { import = "astrocommunity.git.git-blame-nvim", lazy = true },

  -- Base pack with basedpyright and ruff
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.python.basedpyright", enabled = false },
  { import = "astrocommunity.pack.python.ruff", enabled = false },
  -- Configure flutter-tools
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    opts = {
      lsp = {
        settings = {
          lineLength = 120,
        },
      },
    },
  },
}
