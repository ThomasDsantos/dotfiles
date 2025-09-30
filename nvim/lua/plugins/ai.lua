return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      windows = {
        width = 40, -- default % based on available width
      },
      behaviour = {
        auto_suggestions = false,
      },
      -- provider = "numberly",
      -- auto_suggestions_provider = "numberly_completion",
      provider = "copilot",
      auto_suggestions_provider = "copilot_completion",
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          model = "gpt-4.1",
        },
        copilot_completion = {
          __inherited_from = "copilot",
          model = "gpt-4o",
        },
        numberly_completion = {
          __inherited_from = "openai",
          api_key_name = "cmd: echo 'coconut'",
          endpoint = "https://code-completion.numberly.dev/v1",
          model = "Qwen2.5-Coder-1.5B",
        },
        numberly = {
          __inherited_from = "openai",
          api_key_name = "cmd: echo 'coconut'",
          endpoint = "https://code-assistant.numberly.dev/v1",
          model = "Qwen2.5-Coder-32B-Instruct",
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
