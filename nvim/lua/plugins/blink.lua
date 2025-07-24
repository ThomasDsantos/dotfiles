return {
  'saghen/blink.cmp',
  dependencies = {
    'Kaiser-Yang/blink-cmp-avante',
  },
  build = 'cargo build --release',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = { "lsp", "avante", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { 'dadbod', 'snippets', 'buffer' },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink", score_offset = 5 },
        path = {
          opts = {
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
          },
        },
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
        }
      },
    },
    keymap = {
      ['<Up>'] = { 'fallback' },
      ['<Down>'] = { 'fallback' },
      ['<C-p>'] = { function(cmp) cmp.select_prev({ auto_insert = false }) end },
      ['<C-n>'] = { function(cmp) cmp.select_next({ auto_insert = false }) end },
      ["<CR>"] = { 'accept', 'fallback' },
      ["<C-Space>"] = { function(cmp) cmp.show() end },
    },
    signature = { enabled = true },
  }
}
