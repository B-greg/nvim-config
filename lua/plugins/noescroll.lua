return {
  "karb94/neoscroll.nvim",
  lazy = false,
  config = function()
    -- require("neoscroll").setup {}
    local t = {}
    t["<PageUp>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
    t["<PageDown>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
    t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
    t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
    -- require("neoscroll.config").set_mappings(t)
    require("neoscroll").setup { mappings = t }
  end,
}
