-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local utils = require "utils"

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
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
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- Telescope
        ["<C-p>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
        ["<M-p>"] = { "<cmd>Telescope commands<CR>", desc = "Activates Telescope commands" },
        ["<M-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },

        -- Spectre
        ["<leader>fs"] = { desc = "Spectre" },
        ["<leader>fss"] = { '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
        ["<leader>fsp"] = {
          '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
          desc = "Search on current file",
        },
        ["<leader>fsw"] = {
          '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
          desc = "Search current word",
        },

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
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Search current word" },
      },
    },
  },
}
