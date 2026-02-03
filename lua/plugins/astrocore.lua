-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local utils = require "utils"
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- snack
        ["<C-p>"] = { '<cmd>lua require("snacks").picker.smart()<CR>', desc = "Smart Find Files" },
        -- ["<M-p>"] = { "<cmd>Telescope commands<CR>", desc = "Activates Telescope commands" },
        -- ["<M-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },

        -- Neotest
        ["<leader>T"] = { desc = utils.get_icon("󰂓", "", 1) .. "Test" },
        ["<leader>Tr"] = { '<cmd>lua require("neotest").run.run()<CR>', desc = "Run test under cursor" },
        ["<leader>Tf"] = {
          '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
          desc = utils.get_icon("󰸩", "", 1) .. "Run test current file",
        },
        ["<leader>Ts"] = { '<cmd>lua require("neotest").summary.toggle()<CR>', desc = "Toogle test summary" },
        ["<leader>To"] = { '<cmd>lua require("neotest").output.open()<CR>', desc = "Open output" },
        ["<leader>TO"] = { '<cmd>lua require("neotest").output_panel.toggle()<CR>', desc = "Toogle output panel" },
        ["<leader>Td"] = {
          '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>',
          desc = "Debug test under cursor",
        },

        -- Copilot Chat
        ["<leader>a"] = { desc = utils.get_icon("󰂓", "", 1) .. "AI" },
        ["<leader>ap"] = { desc = utils.get_icon("󰂓", "", 1) .. "Copilot" },
        ["<leader>apt"] = { '<cmd>lua require("CopilotChat").toggle()<CR>', desc = "Toggle Copilot Chat" },
        ["<leader>apo"] = { '<cmd>lua require("CopilotChat").open()<CR>', desc = "Open Copilot Chat" },
        ["<leader>apm"] = { '<cmd>lua require("CopilotChat").select_model()<CR>', desc = "Select Model" },
        ["<leader>apr"] = { '<cmd>lua require("CopilotChat").reset()<CR>', desc = "Reset the Chat" },
      },
    },
  },
}
