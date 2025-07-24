return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
      'tpope/vim-dotenv',
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = 'left'
      vim.g.db_ui_winwidth = 30

      -- opening it in a new tab
      vim.keymap.set('n', '<leader>db', ':tab DBUI<cr>', {})

      -- just close the tab, but context related of the keybinding
      vim.keymap.set('n', '<leader>dq', ':tabclose<cr>')
    end,
  },
}
