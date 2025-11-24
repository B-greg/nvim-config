return {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        default_mappings = true,
        mappings = {
          i = {
            j = {
              f = "<Esc>",
            },
            f = {
              j = "<Esc>",
            },
          },
          v = {
            f = {
              j = "<Esc>",
            },
            j = {
              f = "<Esc>",
            },
          },
          s = {
            f = {
              j = "<Esc>",
            },
            j = {
              f = "<Esc>",
            },
          },
          t = {
            f = {
              j = "<Esc>",
            },
            j = {
              f = "<Esc>",
            },
          },
          c = {
            f = {
              j = "<Esc>",
            },
            j = {
              f = "<Esc>",
            },
          },
        },
      }
    end,
    --    opts = function(_, opts)
    --      opts.mapping = { "jk", "jj", "fj", "jf" } -- a table with mappings to use
    --      opts.clear_empty_lines = false -- clear line after escaping if there is only whitespace
    --      opts.keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
    --      return opts
    --    end,
  },
}
