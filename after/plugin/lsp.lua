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


lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
