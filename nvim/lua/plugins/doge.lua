return {
  "kkoomen/vim-doge",
  config = function()
    vim.g.doge_doc_standard_python = 'google'

    vim.keymap.set('n', '<leader>/', '<Plug>(doge-generate)')
  end,
}

