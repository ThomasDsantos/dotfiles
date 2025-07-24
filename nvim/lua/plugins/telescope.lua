return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    require('telescope').setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      },
    })
    require('telescope').load_extension("ui-select")
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>fgw', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
  end,
  lazy = false,
  keys = function()
    return {
      { "<leader>fg",  "<cmd>Telescope git_files<cr>",       desc = "Find git files" },
      { "<leader>ff",  "<cmd>Telescope find_files<cr>",      desc = "Find all files" },
      { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",        desc = "Find in recent" },
      { "<leader>fgf", "<cmd>Telescope live_grep<cr>",       desc = "Git grep" },
      { "<leader>f:",  "<cmd>Telescope command_history<cr>", desc = "Find in command history" },
      { "<leader>fh",  "<cmd>Telescope help_tags<cr>",       desc = "Help" },
      {
        "<leader>fgw",
        function()
          local word = vim.fn.expand("<cword>")
          require('telescope.builtin').grep_string({ search = word })
        end,
        desc = "Find current word"
      },
      {
        "<leader>fga",
        function()
          require('telescope.builtin').live_grep({ additional_args = { "--hidden" }, glob_pattern = "!.git/" })
        end,
        desc = "live grep"
      },
      {
        "<leader>fgA",
        function()
          require('telescope.builtin').live_grep({
            additional_args = { "--hidden", "--no-ignore-vcs" },
            glob_pattern =
            "!.git/"
          })
        end,
        desc = "live grep, include .gitignored files"
      },
      {
        "<leader>fgw",
        function()
          require("telescope.builtin").grep_string({
            search = _G.utils.get_visual_selection_text()[1],
          })
        end,
        mode = "v",
        desc = "Grep visual selection",
      }
    }
  end,
}
