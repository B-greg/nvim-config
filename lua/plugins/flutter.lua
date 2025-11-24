return {
  "nvim-neotest/neotest",
  lazy = true,
  requires = {
    "B-greg/neotest-dart",
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      -- your neotest config here
      adapters = {
        require "neotest-go",
        -- require "neotest-rust",
        -- require "neotest-python",
        require "neotest-dart" {
          command = " flutter", -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        },
      },
    }
  end,
  ft = { "go", "rust", "python", "dart" },
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "sidlatau/neotest-dart",
  },
  --   {
  --     'akinsho/flutter-tools.nvim',
  --     lazy = false,
  --     dependencies = {
  --         'nvim-lua/plenary.nvim',
  --         'stevearc/dressing.nvim', -- optional for vim.ui.select
  --         'mfussenegger/nvim-dap',
  --     },
  --   --  ft = "dart",
  --   --  module = "flutter-tools",
  --     config = function()
  --       require("flutter-tools").setup {
  --     --     decorations = {
  --     --       statusline = {
  --     --         -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
  --     --         -- this will show the current version of the flutter app from the pubspec.yaml file
  --     --         app_version = false,
  --     --         -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
  --     --         -- this will show the currently running device if an application was started with a specific
  --     --         -- device
  --     --         device = true,
  --     --         -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
  --     --         -- this will show the currently selected project configuration
  --     --         project_config = false,
  --     --       }
  --     --     },
  --     --     debugger = { -- integrate with nvim dap + install dart code debugger
  --     --       enabled = true,
  --     --       run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
  --     --       -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
  --     --      -- see |:help dap.set_exception_breakpoints()| for more info
  --     --       exception_breakpoints = {}
  --     --     },
  --     --     flutter_path = "~/fvm/default",
  --     --     fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  --     --     flutter_lookup_cmd = nil,
  --     } -- use defaults
  --     end,
  --   }
}
