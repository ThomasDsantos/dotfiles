return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig",
    'mfussenegger/nvim-dap-python'
  },
  branch = "regexp",
  lazy="false",
  keys = function()
    return {
      { "<leader>vs", "<cmd>:VenvSelect<cr>" },
    }
  end,
  config = function()
    require("venv-selector").setup()
  end,
}
