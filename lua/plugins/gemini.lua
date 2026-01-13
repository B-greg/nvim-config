return {
  "marcinjahn/gemini-cli.nvim",
  cmd = "Gemini",
  -- Example key mappings for common actions:
  keys = {
    { "<leader>a/", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini CLI" },
    { "<leader>aa", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
    { "<leader>af", "<cmd>Gemini add_file<cr>", desc = "Add File" },
    { "<leader>ag", "<cmd>Gemini<cr>", desc = "Open Gemini" },
  },
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    win = {
      wo = { winbar = "GeminiCLI" },
      style = "gemini_cli",
      position = "right",
      width = 0.3,
    },
  },
}
