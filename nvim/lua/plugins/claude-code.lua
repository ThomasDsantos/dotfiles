return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "right",
        width = 0.33, -- 1/3 of editor width
      },
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
  },
  cmd = {
    "ClaudeCode",
  },
}
