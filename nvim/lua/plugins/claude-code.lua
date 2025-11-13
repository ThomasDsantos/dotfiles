return {
  -- {
  --   "greggh/claude-code.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require("claude-code").setup({
  --       window = {
  --         position = "vertical",
  --         width = 0.33,
  --       },
  --       command = "SHELL=/bin/bash claude"
  --     })
  --   end,
  --   keys = {
  --     { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
  --   },
  --   cmd = {
  --     "ClaudeCode",
  --   },
  -- },
  {
    {
      "coder/claudecode.nvim",
      dependencies = { "folke/snacks.nvim" },
      opts = {
        terminal_cmd = "SHELL=/bin/bash claude",

        terminal = {
          split_side = "right", -- "left" or "right"
          split_width_percentage = 0.33,
          provider = "auto",    -- "auto", "snacks", "native", "external", "none", or custom provider table
        },
      },
      config = function(_, opts)
        require("claudecode").setup(opts)

        -- Add autocmd to set up terminal navigation keymaps for Claude Code buffer
        vim.api.nvim_create_autocmd("TermOpen", {
          pattern = "*",
          callback = function()
            -- Add terminal mode keymaps for window navigation
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { buffer = true, silent = true })
            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { buffer = true, silent = true })
            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { buffer = true, silent = true })
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { buffer = true, silent = true })
          end,
        })
      end,
      keys = {
        { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
        { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
        { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
        { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
        { "<leader>cv", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
        {
          "<leader>cf",
          "<cmd>ClaudeCodeTreeAdd<cr>",
          desc = "Add file",
          ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        },
        -- Diff management
        { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
      },
    },
    {
      'pittcat/claude-fzf-history.nvim',
      dependencies = { 'ibhagwan/fzf-lua' },
      config = function()
        require('claude-fzf-history').setup()
      end,
      cmd = { 'ClaudeHistory', 'ClaudeHistoryDebug' },
    }
  }
}
