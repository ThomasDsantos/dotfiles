return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
      },
    })
  end,
  keys = {
    { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Go next hunk" },
    { "<leader>gN", "<cmd>Gitsigns prev_hunk<cr>", desc = "Go prev hunk" },
    { "<leader>gip", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Go prev hunk" },
  },
  lazy = false,
}
