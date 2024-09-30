return {
  "karb94/neoscroll.nvim",
  lazy = false,
  config = function()
    -- -- require("neoscroll").setup {}
    --local t = {}
    --t["<PageUp>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
    --t["<PageDown>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
    --t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
    --t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
    -- -- require("neoscroll.config").set_mappings(t)
    -- require("neoscroll").setup { mappings = t }

    neoscroll = require "neoscroll"
    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u { duration = 250 } end,
      ["<C-d>"] = function() neoscroll.ctrl_d { duration = 250 } end,
      ["<PageUp>"] = function() neoscroll.ctrl_b { duration = 250 } end,
      ["<PageDown>"] = function() neoscroll.ctrl_f { duration = 250 } end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
