return {
  -- "nvim-neo-tree/neo-tree.nvim",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "nvim-tree/nvim-web-devicons",
  --   "MunifTanjim/nui.nvim",
  -- },
  -- config = function()
  --   require('neo-tree').setup({
  --     close_if_last_window = true,
  --     filesystem = {
  --       filtered_items = {
  --         hide_dotfiles = false,
  --         hide_gitignored = true,
  --         hide_by_name = {
  --           ".git"
  --         },
  --       },
  --       window = {
  --         mappings = {
  --           ["B"] = "noop"
  --         },
  --       },
  --       follow_current_file = {
  --         enabled = true
  --       },
  --     },
  --     event_handlers = {
  --       {
  --         event = "neo_tree_buffer_enter",
  --         handler = function()
  --           vim.cmd [[
  --           setlocal relativenumber
  --         ]]
  --         end,
  --       }
  --     },
  --   })
  --   vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle<CR>')
  -- end,
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { "<leader>b", "<cmd>Oil<cr>" },
  }
}
