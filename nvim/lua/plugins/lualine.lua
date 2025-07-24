return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = {
    "folke/noice.nvim",
  },
  config = function()
    require('lualine').setup({
      sections = {
        lualine_c = {
          { 'filename', path = 1 }
        },
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          'encoding', 'fileformat', 'filetype'
        },
      },
      options = {
        theme = 'dracula',
      }
    })
  end
}
