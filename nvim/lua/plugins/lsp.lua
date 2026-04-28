return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "j-hui/fidget.nvim",
    'saghen/blink.cmp',
  },
  config = function()
    vim.diagnostic.config({ virtual_text = true })
    vim.filetype.add {
      extension = {
        jinja = 'jinja',
        jinja2 = 'jinja',
        j2 = 'jinja',
      },
    }
    vim.filetype.add({
      pattern = {
        [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbook.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
      },
    })

    require("fidget").setup({})
    require("mason").setup()

    vim.lsp.enable({
      "ansiblels",
      "bashls",
      "cspell_ls",
      "dockerls",
      "eslint",
      "gopls",
      "helm_ls",
      "jsonls",
      "lua_ls",
      "nil_ls",
      "pyright",
      "ruff",
      "rust_analyzer",
      "sqls",
      "ts_ls",
      "vue_ls",
      "yamlls",
    })
  end,
  keys = {
    { '<leader>gd', vim.lsp.buf.definition },
    { '<leader>gD', vim.lsp.buf.declaration },
    { '<leader>gi', vim.lsp.buf.implementation },
    { '<leader>go', vim.lsp.buf.type_definition },
    { '<leader>gr', vim.lsp.buf.references },
    { '<leader>gh', vim.lsp.buf.signature_help },
    { '<F2>',       vim.lsp.buf.rename },
    { '<F4>',       vim.lsp.buf.code_action },
  },
  lazy = false,
}
