local utils = require "utils"
return {
  "marcinjahn/gemini-cli.nvim",
  cmd = "Gemini",
  -- Example key mappings for common actions:
  keys = {
    { "<leader>ag", desc = utils.get_icon("", "", 1) .. "Gemini" },
    { "<leader>agt", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini CLI" },
    { "<leader>aga", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
    { "<leader>agf", "<cmd>Gemini add_file<cr>", desc = "Add File" },
    { "<leader>ago", "<cmd>Gemini<cr>", desc = "Open Gemini" },
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
