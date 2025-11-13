-- Mason
local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
  vim.notify("Mason não encontrado")
  return
end

mason.setup()

-- Mason-LSPConfig
local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
  vim.notify("Mason-LSPConfig não encontrado")
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "jsonls",
    "yamlls",
    "dockerls",
    "ts_ls",
    "jdtls",
    "mason-java-format",
  },
})
