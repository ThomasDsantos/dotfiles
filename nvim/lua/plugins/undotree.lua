return {
  {
    "mbbill/undotree",
    keys = function()
      return {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "undotree toggle" },
      }
    end,
    lazy = false,
  }
}
