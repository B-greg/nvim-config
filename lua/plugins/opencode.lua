local utils = require "utils.init"
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    {
      "folke/snacks.nvim",
      opts = {
        input = {},
        picker = {},
        terminal = {},
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      provider = {
        snacks = {
          win = {
            position = "right",
            width = 0.3,
          },
        },
      },
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.

    vim.keymap.set(
      { "n", "x" },
      "<leader>ac",
      function() require "opencode" end,
      { desc = utils.get_icon("󰨔", "", 1) .. "OpenCode" }
    )
    vim.keymap.set(
      { "n", "x" },
      "<leader>aca",
      function() require("opencode").ask("@this: ", { submit = true }) end,
      { desc = "Ask opencode…" }
    )
    vim.keymap.set(
      { "n", "x" },
      "<leader>acx",
      function() require("opencode").select() end,
      { desc = "Execute opencode action…" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<leader>act",
      function() require("opencode").toggle() end,
      { desc = "Toggle opencode" }
    )

    vim.keymap.set(
      { "n", "x" },
      "<leader>aco",
      function() return require("opencode").operator "@this " end,
      { desc = "Add range to opencode", expr = true }
    )
    vim.keymap.set(
      "n",
      "<leader>acoo",
      function() return require("opencode").operator "@this " .. "_" end,
      { desc = "Add line to opencode", expr = true }
    )

    vim.keymap.set(
      "n",
      "<S-C-u>",
      function() require("opencode").command "session.half.page.up" end,
      { desc = "Scroll opencode up" }
    )
    vim.keymap.set(
      "n",
      "<S-C-d>",
      function() require("opencode").command "session.half.page.down" end,
      { desc = "Scroll opencode down" }
    )

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
    -- vim.keymap.set("n", "+", "<leader>aci", { desc = "Increment under cursor", noremap = true })
    -- vim.keymap.set("n", "-", "<leader>acd", { desc = "Decrement under cursor", noremap = true })
  end,
}
