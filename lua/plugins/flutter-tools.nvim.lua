return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
  },

  opts = {
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
          lineLength = 100,
        },
      },
    },
  },
}
