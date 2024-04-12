return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require "telescope" end,
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  vim.api.nvim_set_keymap("n", "<space>fB", ":Telescope file_browser<CR>", { noremap = true }),
  --
  -- -- open file_browser with the path of the current buffer
  -- vim.api.nvim_set_keymap(
  --   "n",
  --   "<space>fB",
  --   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  --   { noremap = true }
  -- )
}
