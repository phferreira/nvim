return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_utils = require("dap.utils")

      -- ======================
      -- UI Setup
      -- ======================
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      require("mason-nvim-dap").setup({
        ensure_installed = { "js" },
      })

      -- ======================
      -- JavaScript / TypeScript
      -- ======================
      local js_debug_adapter = vim.fn.exepath("js-debug-adapter")
      if js_debug_adapter == "" then
        js_debug_adapter = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter"
      end

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = js_debug_adapter,
          args = { "${port}", "127.0.0.1" },
        },
        options = {
          max_retries = 40,
        },
      }

      local js_ts_configurations = {
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch current file",
        --   cwd = "${workspaceFolder}",
        --   program = "${file}",
        --   console = "integratedTerminal",
        --   sourceMaps = true,
        --   skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        -- },
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch current file with tsx",
        --   cwd = "${workspaceFolder}",
        --   runtimeExecutable = "node",
        --   runtimeArgs = { "--import", "tsx" },
        --   args = { "${file}" },
        --   console = "integratedTerminal",
        --   sourceMaps = true,
        --   skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        -- },
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Run npm script",
        --   cwd = "${workspaceFolder}",
        --   runtimeExecutable = "npm",
        --   runtimeArgs = {
        --     "run",
        --     function()
        --       return vim.fn.input("npm script: ")
        --     end,
        --   },
        --   console = "integratedTerminal",
        --   sourceMaps = true,
        --   skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        -- },
        -- {
        --   type = "pwa-node",
        --   request = "attach",
        --   name = "Attach to process",
        --   processId = dap_utils.pick_process,
        --   cwd = "${workspaceFolder}",
        --   sourceMaps = true,
        --   skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        -- },
        -- {
        --   type = "pwa-node",
        --   request = "attach",
        --   name = "Attach to port 9229",
        --   cwd = "${workspaceFolder}",
        --   port = 9229,
        --   sourceMaps = true,
        --   skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        -- },
      }

      for _, language in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
        dap.configurations[language] = js_ts_configurations
      end

      -- ======================
      -- Função Python Path
      -- ======================
      local function get_python_path()
        local cwd = vim.fn.getcwd()
        local venv = cwd .. "/.venv/bin/python"
        if vim.fn.filereadable(venv) == 1 then
          return venv
        end
        local venv_env = os.getenv("VIRTUAL_ENV")
        if venv_env then
          return venv_env .. "/bin/python"
        end
        return vim.fn.exepath("python3") or "/usr/bin/python3"
      end

      -- ======================
      -- Adaptador Python
      -- ======================
      dap.adapters.python = {
        type = "executable",
        command = get_python_path(),
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Debug FastAPI",
          module = "uvicorn",
          args = { "app.main:app" },
          pythonPath = get_python_path,
          cwd = vim.fn.getcwd(),
          env = { PYTHONPATH = vim.fn.getcwd() },
        },
      }

      -- ======================
      -- Função FVM (detectar versão ativa)
      -- ======================
      local function get_fvm_bin(bin)
        local fvm_base = vim.fn.expand("~") .. "/fvm/versions"

        -- tenta stable primeiro
        local stable_bin = fvm_base .. "/stable/bin/" .. bin
        if vim.fn.executable(stable_bin) == 1 then
          return stable_bin
        end

        -- fallback: pega primeira versão instalada
        local handle = io.popen("ls -1 " .. fvm_base)
        local result = handle:read("*a")
        handle:close()

        for version in string.gmatch(result, "[^\n]+") do
          local try_bin = fvm_base .. "/" .. version .. "/bin/" .. bin
          if vim.fn.executable(try_bin) == 1 then
            return try_bin
          end
        end

        return vim.fn.exepath(bin)
      end

      -- ======================
      -- Adaptadores Dart e Flutter
      -- ======================
      dap.adapters.dart = {
        type = "executable",
        command = get_fvm_bin("dart"),
        args = { "debug_adapter" },
      }

      dap.adapters.flutter = {
        type = "executable",
        command = get_fvm_bin("flutter"),
        args = { "debug_adapter" },
      }

      -- ======================
      -- Configurações Dart & Flutter
      -- ======================
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Debug Dart File",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.flutter = {
        {
          type = "flutter",
          request = "launch",
          name = "Launch Flutter Linux",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
          args = { "-d", "linux" },
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch Flutter Chrome",
          program = "${workspaceFolder}/lib/main.dart",
        },
      }
    end,
  },
}
