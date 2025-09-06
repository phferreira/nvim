require("flutter-tools").setup {
  fvm = true,
  debugger = {
    enabled = true,
    run_via_dap = true,
    exception_breakpoints = {},
    register_configurations = function(paths)
      require('dap').adapters.dart = function(callback, config)
        local cwd = config.cwd or vim.fn.getcwd()
        local pubspec_path = cwd .. "/pubspec.yaml"

        local is_flutter = false

        -- Detecta se é projeto Flutter
        local file = io.open(pubspec_path, "r")
        if file then
          for line in file:lines() do
            if line:match("^%s*flutter:") then
              is_flutter = true
              break
            end
          end
          file:close()
        end

        local command = is_flutter
            and vim.fn.exepath("fvm") .. " flutter"
            or vim.fn.exepath("fvm") .. " dart"

        -- Como o dart-debug-adapter é um bin Node que espera `dart` ou `flutter` como argumento,
        -- usamos sempre o mesmo adapter binário com o argumento correto
        callback({
          type = "executable",
          command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
          args = { is_flutter and "flutter" or "dart" },
        })
      end
      require("dap").configurations.dart = {
        {
          type = 'dart',
          request = 'launch',
          name = 'Launch Dart',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'flutter',
          request = 'launch',
          name = 'Launch Flutter Linux',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
          args = {
            '-d', 'linux',
          },
          toolArgs = {
          }
        },
        {
          type = 'flutter',
          request = 'launch',
          name = 'Launch Flutter Chrome',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
          toolArgs = {
            '-d', 'chrome',
          }
        }
      }
      local dap = require("dap")
      local json = require("dap.ext.vscode").json_decode

      local file = io.open(".vscode/launch.json", "r")
      if file then
        local content = file:read("*a")
        file:close()
        local configs = json(content)

        for _, config in pairs(configs.configurations) do
          if not dap.configurations[config.type] then
            dap.configurations[config.type] = {}
          end
          table.insert(dap.configurations[config.type], 1, config)
        end
      end
      require("dap").defaults.fallback.force_external_terminal = false -- Opcional: evita abrir terminais externos
      require("dap").defaults.fallback.pick_if_many = function(items, prompt, label_fn)
        print("Modificando a seleção do DAP...")
        if #items == 1 then
          return items[1]
        end
        return require("dap.ui").pick(items, prompt, label_fn)
      end
    end,
  },
  dev_log = {
    enabled = false,
  },
  lsp = {
    on_attach = function(client, bufnr)
      require("lsp-zero").on_attach(client, bufnr)
    end,
    settings = {
      dart = {
        lineLength = 100
      }
    }
  }
}
