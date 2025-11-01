require("flutter-tools").setup {
  fvm = true,
  debugger = {
    enabled = true,
    run_via_dap = true,
    exception_breakpoints = {},
  },
  dev_log = {
    enabled = false,
  },
  lsp = {
    settings = {
      dart = {
        lineLength = 100
      }
    }
  }
}
