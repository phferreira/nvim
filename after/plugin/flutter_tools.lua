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
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  dev_log = {
    enabled = false,
  },
}
