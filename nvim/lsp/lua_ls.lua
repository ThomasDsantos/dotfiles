return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  telemetry = { enabled = false },
  formatters = {
    ignoreComments = false,
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
}
