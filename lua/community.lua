-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.rust" },
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
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.java" },
  -- Configure flutter-tools
  {
    "akinsho/flutter-tools.nvim",
    opts = {
      lsp = {
        settings = {
          lineLength = 120,
        },
      },
    },
  },
}
