-- ===========================
-- LSP Configuration (Neovim 0.11+)
-- ===========================

-- Capabilities padrão (para nvim-cmp/autocomplete)
local capabilities = vim.lsp.protocol.make_client_capabilities()

local function get_root_dir(patterns)
  patterns = patterns or { ".git" }
  local cwd = vim.fn.getcwd()
  for _, pattern in ipairs(patterns) do
    local found = vim.fn.findfile(pattern, cwd .. ";")
    if found ~= "" then
      return vim.fn.fnamemodify(found, ":h")
    end
  end
  return cwd
end

vim.lsp.config.pyright = {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
      venvPath = vim.fn.expand("~/.virtualenvs"), -- onde ficam seus venvs (ajuste)
      venv = "venv",                              -- nome do seu venv (exemplo)
    },
  },
  on_init = function(client)
    local venv = vim.fn.findfile("pyvenv.cfg", ".;")
    if venv ~= "" then
      local venv_dir = vim.fn.fnamemodify(venv, ":h")
      vim.env.VIRTUAL_ENV = venv_dir
      vim.env.PATH = venv_dir .. "/bin:" .. vim.env.PATH
    end
  end,
}

vim.lsp.config.lua_ls = {
  capabilities = capabilities,
  -- Define quais arquivos ativam o LSP
  filetypes = { "lua" },
  -- Detecta raiz do projeto baseado em arquivos padrões
  root_dir = get_root_dir({ ".luarc.json", ".luarc.jsonc", ".git" }),
  settings = {
    Lua = {
      runtime = {
        -- Usa LuaJIT (compatível com Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Reconhece global 'vim' para evitar falsos positivos
        globals = { "vim" },
      },
      workspace = {
        -- Inclui runtime do Neovim para autocompletar APIs
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- evita aviso desnecessário
      },
      telemetry = {
        enable = false, -- desativa coleta de dados
      },
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function(args)
    -- Verifica se o lua_ls está ativo para este buffer
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    for _, client in ipairs(clients) do
      if client.name == "lua_ls" and client.server_capabilities.documentFormattingProvider then
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
        return
      end
    end
  end,
})

-- Opcional: configura diagnósticos globais
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { border = "rounded" },
})
