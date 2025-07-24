  vim.lsp.config('cspell_ls', {
    cmd = { 'cspell-lsp', '--stdio', '-c', '/home/thdo/.config/nvim/cspell.json', '--sortWords'},
    root_markers = {
      '.git',
      'cspell.json',
      '.cspell.json',
      'cspell.json',
      '.cSpell.json',
      'cSpell.json',
      'cspell.config.js',
      'cspell.config.cjs',
      'cspell.config.json',
      'cspell.config.yaml',
      'cspell.config.yml',
      'cspell.yaml',
      'cspell.yml',
    },
  })

return {}
