-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec

return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local astro = require "astrocore"

        -- postman tui
        local posting = "posting"
        if vim.fn.executable(posting) ~= 1 then
          if vim.fn.executable "atac" == 1 then posting = "atac" end
        end
        if vim.fn.executable(posting) == 1 then
          maps.n["<Leader>tP"] = {
            function()
              local cmd = posting
              -- Check if "posting" folder exists in the project root
              local posting_folder = vim.fn.getcwd() .. "/posting"
              if vim.fn.isdirectory(posting_folder) == 1 then cmd = posting .. " --collection posting" end
              astro.toggle_term_cmd { cmd = cmd, direction = "float" }
            end,
            desc = "ToggleTerm posting",
          }
        end
        if vim.fn.executable "rainfrog" == 1 then
          maps.n["<Leader>tr"] = {
            function() astro.toggle_term_cmd { cmd = "rainfrog", direction = "float" } end,
            desc = "ToggleTerm rainfrog",
          }
        end
      end,
    },
  },
}

-- return {
--
--   -- == Examples of Adding Plugins ==
--
--   "andweeb/presence.nvim",
--   {
--     "ray-x/lsp_signature.nvim",
--     event = "BufRead",
--     config = function() require("lsp_signature").setup() end,
--   },
--
--   -- == Examples of Overriding Plugins ==
--
--   -- customize dashboard options
--   {
--     "folke/snacks.nvim",
--     opts = {
--       dashboard = {
--         preset = {
--           header = table.concat({
--             " █████  ███████ ████████ ██████   ██████ ",
--             "██   ██ ██         ██    ██   ██ ██    ██",
--             "███████ ███████    ██    ██████  ██    ██",
--             "██   ██      ██    ██    ██   ██ ██    ██",
--             "██   ██ ███████    ██    ██   ██  ██████ ",
--             "",
--             "███    ██ ██    ██ ██ ███    ███",
--             "████   ██ ██    ██ ██ ████  ████",
--             "██ ██  ██ ██    ██ ██ ██ ████ ██",
--             "██  ██ ██  ██  ██  ██ ██  ██  ██",
--             "██   ████   ████   ██ ██      ██",
--           }, "\n"),
--         },
--       },
--     },
--   },
--
--   -- You can disable default plugins as follows:
--   { "max397574/better-escape.nvim", enabled = false },
--
--   -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
--   {
--     "L3MON4D3/LuaSnip",
--     config = function(plugin, opts)
--       require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
--       -- add more custom luasnip configuration such as filetype extend or custom snippets
--       local luasnip = require "luasnip"
--       luasnip.filetype_extend("javascript", { "javascriptreact" })
--     end,
--   },
--
--   {
--     "windwp/nvim-autopairs",
--     config = function(plugin, opts)
--       require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
--       -- add more custom autopairs configuration such as custom rules
--       local npairs = require "nvim-autopairs"
--       local Rule = require "nvim-autopairs.rule"
--       local cond = require "nvim-autopairs.conds"
--       npairs.add_rules(
--         {
--           Rule("$", "$", { "tex", "latex" })
--             -- don't add a pair if the next character is %
--             :with_pair(cond.not_after_regex "%%")
--             -- don't add a pair if  the previous character is xxx
--             :with_pair(
--               cond.not_before_regex("xxx", 3)
--             )
--             -- don't move right when repeat character
--             :with_move(cond.none())
--             -- don't delete if the next character is xx
--             :with_del(cond.not_after_regex "xx")
--             -- disable adding a newline when you press <cr>
--             :with_cr(cond.none()),
--         },
--         -- disable for .vim files, but it work for another filetypes
--         Rule("a", "a", "-vim")
--       )
--     end,
--   },
-- }
