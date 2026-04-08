-- Customize Treesitter
-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "query",
      "vimdoc",
      "markdown",
      "markdown_inline",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
