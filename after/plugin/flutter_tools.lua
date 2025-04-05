require("flutter-tools").setup {
  debugger = {
    enabled = true,
    exception_breakpoints = {},
    register_configurations = function(paths)
      require('dap').adapters.dart = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter', -- dart-debug-adapter.cmd for windows users
        args = { 'dart' }
      }
      require('dap').adapters.flutter = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter', -- dart-debug-adapter.cmd for windows users
        args = { 'flutter' }
      }
      require("dap").configurations.dart = {
        {
          type = 'dart',
          request = 'launch',
          name = 'Launch Dart',
          dartSdkPath = '/home/paulo/.development/flutter/bin',
          flutterSdkPath = '/home/paulo/.development/flutter/bin',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'flutter',
          request = 'launch',
          name = 'Launch Flutter Linux',
          dartSdkPath = '/home/paulo/.development/flutter/bin',
          flutterSdkPath = '/home/paulo/.development/flutter/bin',
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
          dartSdkPath = '/home/paulo/.development/flutter/bin',
          flutterSdkPath = '/home/paulo/.development/flutter/bin',
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
      vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
    end,
    settings = {
      dart = {
        lineLength = 80
      }
    }
  }
}
