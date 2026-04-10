local utils = require "utils"

local win_opts = {
  position = "right",
  width = 0.35,
  wo = { winbar = "Claude Code" },
}

---@param cmd string
---@param opts? table
local function claude_toggle(cmd, opts) require("snacks.terminal").toggle(cmd, opts) end

---@param cmd string
---@param opts? table
local function claude_open(cmd, opts) require("snacks.terminal").open(cmd, opts) end

return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>aC", desc = utils.get_icon("", "CC", 1) .. "Claude Code" },
    {
      "<leader>aCt",
      function() claude_toggle("claude", { win = win_opts }) end,
      desc = "Toggle Claude Code",
    },
    {
      "<leader>aCo",
      function() claude_open("claude", { win = win_opts }) end,
      desc = "Open Claude Code",
    },
    {
      "<leader>aCa",
      function()
        local lines = vim.fn.getline(vim.fn.line "'<", vim.fn.line "'>")
        local selection = table.concat(lines, "\n")
        claude_open("claude", { win = win_opts })
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
