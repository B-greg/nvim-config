if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local utils = require "utils"

return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      claude_code = {
        bo = { filetype = "claude_code" },
        wo = { winbar = "Claude Code" },
        position = "right",
        width = 0.35,
      },
    },
  },
  keys = {
    { "<leader>aC", desc = utils.get_icon("", "CC", 1) .. "Claude Code" },
    {
      "<leader>aCt",
      function() require("snacks").terminal.toggle("claude", { style = "claude_code" }) end,
      desc = "Toggle Claude Code",
    },
    {
      "<leader>aCo",
      function() require("snacks").terminal("claude", { style = "claude_code" }) end,
      desc = "Open Claude Code",
    },
    {
      "<leader>aCa",
      function()
        local lines = vim.fn.getline(vim.fn.line "'<", vim.fn.line "'>")
        local selection = table.concat(lines, "\n")
        require("snacks").terminal("claude", { style = "claude_code" })
        if selection ~= "" then
          vim.defer_fn(function()
            local term_buf = vim.fn.bufnr "claude_code"
            if term_buf ~= -1 then vim.api.nvim_chan_send(vim.bo[term_buf].channel, selection .. "\n") end
          end, 300)
        end
      end,
      desc = "Ask Claude Code",
      mode = { "n", "v" },
    },
  },
}
