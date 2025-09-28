local dap = require('dap')

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

local function get_python_path()
  local cwd = vim.fn.getcwd()
  local venv = cwd .. '/.venv/bin/python'
  if vim.fn.filereadable(venv) == 1 then
    return venv
  end
  local venv_env = os.getenv("VIRTUAL_ENV")
  if venv_env then
    return venv_env .. '/bin/python'
  end
  return vim.fn.exepath('python3') or '/usr/bin/python3'
end

dap.adapters.python = {
  type = 'executable',
  command = get_python_path(),
  args = { '-m', 'debugpy.adapter' },
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
  }
}
