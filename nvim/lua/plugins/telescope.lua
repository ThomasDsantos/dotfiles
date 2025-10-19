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
  end,
  lazy = false,
  keys = function()
    return {
      { "<leader>ff",  "<cmd>Telescope git_files<cr>",       desc = "Find git files" },
      { "<leader>fa",  "<cmd>Telescope find_files<cr>",      desc = "Find all files" },
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
        "<leader>fgp",
        function()
          local word = vim.fn.expand("<cword>")
          require('telescope.builtin').grep_string(
            {
              search = word,
              file_ignore_patterns = {
                ".*test.*",
                ".*Test.*",
                ".*TEST.*",
                "test/.*",
                "tests/.*",
                "Test/.*",
                "Tests/.*",
                "TEST/.*",
                "TESTS/.*",
                "__tests__/.*",
                "spec/.*",
                "specs/.*",
                "*.test.*",
                "*.spec.*"
              }
            }
          )
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
      },
      {
        "<leader>fp",
        function()
          require('telescope.builtin').git_files({
            file_ignore_patterns = {
              ".*test.*",
              ".*Test.*",
              ".*TEST.*",
              "test/.*",
              "tests/.*",
              "Test/.*",
              "Tests/.*",
              "TEST/.*",
              "TESTS/.*",
              "__tests__/.*",
              "spec/.*",
              "specs/.*",
              "*.test.*",
              "*.spec.*"
            }
          })
        end,
        desc = "Find git project files (exclude tests)"
      },
    }
  end,
}
