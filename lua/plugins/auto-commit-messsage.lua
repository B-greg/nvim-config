return {
  "ryancraigdavis/AutoCommitMessage.nvim",
  dependencies = {
    "CopilotC-Nvim/CopilotChat.nvim",
  },
  ft = "gitcommit",
  opts = {
    -- Enable/disable auto-generation on gitcommit filetype
    enabled = true,

    -- Prompt sent to CopilotChat for generating commit messages
    prompt = "Write commit message for the change with commitizen convention. "
      .. 'Write clear, informative commit messages that explain the "what" and "why" '
      .. 'behind changes, not just the "how". '
      .. "Return ONLY the commit message, no explanation or markdown formatting.",

    -- Only use staged changes (true) or all changes (false)
    staged_only = true,

    -- Delay in ms before triggering generation (allows buffer to fully load)
    defer_delay = 500,

    -- Show notification when commit message is inserted
    notify = true,

    -- Auto-close CopilotChat window after generation
    auto_close_chat = true,

    -- Keymap for manual trigger (nil = disabled)
    -- Example: "<leader>gcm"
    keymap = "<leader>gm",
  },
  lazy = false,
}
