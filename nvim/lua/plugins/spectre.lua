return {
  "nvim-pack/nvim-spectre",
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = function ()
    return {
      { "<leader>s",  "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle spectre" },
    }
  end
}
