return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      telemetry = {
        enable = false,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "vim", "require" },
      },
      format = {
        enable = false,
      },
    },
  },
}
