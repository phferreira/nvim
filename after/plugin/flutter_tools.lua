local ok_ft, flutter_tools = pcall(require, "flutter-tools")
if not ok_ft then
  vim.notify("flutter-tools.nvim não encontrado!", vim.log.levels.WARN)
  return
end

flutter_tools.setup {
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
    },
  }
}
