return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end)
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
  end
}

