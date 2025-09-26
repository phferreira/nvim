local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { 'javascript', 'typescript' },
    ['rust_analyzer'] = { 'rust' },
    ['dartls'] = { 'dart' },
    ['lua_ls'] = { 'lua' },
    ['jdtls'] = { 'java' },
    ['black'] = { 'python' }
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'rust_analyzer',
    'yamlls',
    'vimls',
    'dockerls',
    'jsonls',
    'sqlls',
    'jdtls',
    'pyright'
  },

  handlers = {
    lsp_zero.default_setup,
  },
})

local mason_registry = require("mason-registry")

local ensure_installed = { "black", "debugpy" }

for _, pkg_name in ipairs(ensure_installed) do
  local pkg = mason_registry.get_package(pkg_name)
  if not pkg:is_installed() then
    pkg:install()
  end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
  {
    name = "lua_ls",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc", ".git" }),
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "require" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  },
  {
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "requirements.txt", ".git" }),
  },
  -- {
  --   name = "jdtls",
  --   cmd = { "jdtls" },
  --   root_markers = { "pom.xml", "gradlew", "mvnw", ".git" },
  -- },
}

for _, config in ipairs(servers) do
  config.capabilities = capabilities
  vim.lsp.start(config)
end
