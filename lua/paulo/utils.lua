function DoPrettyXML()
  vim.cmd('set ft=xml')
  vim.cmd(':0')
  vim.cmd(':silent! %s/> *</>\r</g')
  vim.cmd(':0')
  vim.cmd(':normal gg=G')
end

vim.cmd('command! PrettyXML execute \'lua DoPrettyXML()\'')

local diagnostics_active = true
function ToggleDiagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show(nil, 0)
  else
    vim.diagnostic.hide(nil, 0)
  end
end

local vim = vim
local loop = vim.loop

local watchers = {}

local function on_change(bufnr, filepath)
  vim.print(bufnr)
  vim.api.nvim_buf_call(bufnr, function()
    vim.cmd('checktime')
    vim.cmd('normal Gzz')
  end)
end

local function watch_file(bufnr, filepath)
  local w = loop.new_fs_poll()
  w:start(filepath, 1000, vim.schedule_wrap(function()
    on_change(bufnr, filepath)
  end))
  watchers[bufnr] = w
end

local function stop_watch(bufnr)
  local w = watchers[bufnr]
  if w then
    w:stop()
    watchers[bufnr] = nil
  end
end

function DoTail()
  local current_buffer_number = vim.fn.bufnr('%')

  if vim.b[current_buffer_number].isTail == nil then
    vim.b[current_buffer_number].isTail = false
  end

  if vim.b[current_buffer_number].isTail then
    stop_watch(current_buffer_number)
    vim.b[current_buffer_number].isTail = false
  else
    vim.cmd('setlocal syntax=logtalk')
    watch_file(current_buffer_number, vim.fn.expand('%:p'))
    vim.b[current_buffer_number].isTail = true
  end
end

vim.cmd('command! Tail execute \'lua DoTail()\'')

-- SAVE/RESTORE FOLDS ON OPEN FILES
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*.*" },
  desc = "save view (folds), when closing file",
  command = "mkview",
})

-- FORMAT
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil

  -- Se for chamado com range (como em visual mode)
  if args.range > 0 then
    -- Lê o final da linha para capturar o comprimento corretamente
    local end_line_content = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, false)[1] or ""
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, #end_line_content },
    }
  end

  require("conform").format({
    async = true,
    lsp_format = "fallback",
    range = range,
  })
end, { range = true })
