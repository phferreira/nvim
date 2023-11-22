local dap = require('dap')

dap.adapters.dart = {
  type = 'executable',
  command = 'dart',
  args = { 'debug_adapter' }
}
dap.adapters.flutter = {
  type = 'executable',
  command = 'flutter',
  args = { 'debug_adapter' }
}
dap.configurations.dart = {
  {
    type = 'dart',
    request = 'launch',
    name = 'Launch dart',
    dartSdkPath = '/home/paulo/.development/flutter/bin/cache/dart-sdk/bin', -- ensure this is correct
    flutterSdkPath = '/home/paulo/.development/flutter/',                    -- ensure this is correct
    program = '${workspaceFolder}/lib/main.dart',                            -- ensure this is correct
    cwd = '${workspaceFolder}',
    toolArgs = {
      '--dart-define-from-file', './keys.json'
    }
  },
  {
    type = 'flutter',
    request = 'launch',
    name = 'Launch Flutter Linux',
    dartSdkPath = '/home/paulo/.development/flutter/bin/cache/dart-sdk/bin', -- ensure this is correct
    flutterSdkPath = '/home/paulo/.development/flutter/',                    -- ensure this is correct
    program = '${workspaceFolder}/lib/main.dart',                            -- ensure this is correct
    cwd = '${workspaceFolder}',
    toolArgs = {
      '-d', 'linux',
      '--dart-define-from-file', './keys.json'
    }
  },
  {
    type = 'flutter',
    request = 'launch',
    name = 'Launch Flutter Chrome',
    dartSdkPath = '/home/paulo/.development/flutter/bin/cache/dart-sdk/bin', -- ensure this is correct
    flutterSdkPath = '/home/paulo/.development/flutter/',                    -- ensure this is correct
    program = '${workspaceFolder}/lib/main.dart',                            -- ensure this is correct
    cwd = '${workspaceFolder}',
    toolArgs = {
      '-d', 'chrome',
      '--dart-define-from-file', './keys.json'
    }
  }
}

local dapui = require('dapui')
dapui.setup();

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
