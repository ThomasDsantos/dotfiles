return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup({
      -- Configuration options will be added here
      -- Check :help claude-code for available options
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
  },
  cmd = {
    "ClaudeCode",
  },
}
