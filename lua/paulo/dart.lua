function FlutterAnalyze()
  local file = '__Flutter_Analyze__'

  if (vim.fn.buflisted(file) == 0) then
    vim.cmd('new ' .. file)
  else
    vim.cmd('buffer ' .. file)
    vim.cmd('%d')
  end

  vim.cmd('r!fvm flutter analyze')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=hide')
end

function FlutterTestAll()
  local file = '__Flutter_Test_All__'

  if (vim.fn.buflisted(file) == 0) then
    vim.cmd('new ' .. file)
  else
    vim.cmd('buffer ' .. file)
    vim.cmd('%d')
  end

  vim.cmd('r!fvm flutter test -j 10 --reporter expanded ')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=hide')
end

function FlutterTest()
  local path = vim.fn.expand('%:p')
  local file = '__Flutter_Test_' .. vim.fn.expand('%:t') .. '__'
  local flutterTest = ':r!fvm flutter test -j 10 --reporter expanded '

  if (vim.fn.buflisted(file) == 0) then
    vim.cmd(':new ' .. file)
  else
    vim.cmd('buffer ' .. file)
    vim.cmd(':%d')
  end

  vim.cmd(flutterTest .. path)
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=hide')
end

function FlutterCreateTest()
  local filePath = vim.fn.expand('%:r')
  local file = vim.fn.substitute(filePath, 'lib/', 'test/', '') .. '_test.dart'

  if vim.fn.filereadable(file) == 1 then
    vim.cmd('edit ' .. file)
  else
    vim.cmd('write ++p ' .. file .. ' | edit ' .. file .. ' | %d')
    vim.fn.append(vim.fn.line('^'), "import 'package:flutter_test/flutter_test.dart';")
    vim.fn.append(vim.fn.line('$'), "void main() {")
    vim.fn.append(vim.fn.line('$'), "  test('...', () {")
    vim.fn.append(vim.fn.line('$'), "    // TODO: Implement test")
    vim.fn.append(vim.fn.line('$'), "  });")
    vim.fn.append(vim.fn.line('$'), "}")
  end
end

function FlutterRun()
  -- local filePath = vim.fn.expand('%:r')
  if vim.fn.filereadable('./.keys.json') == 1 then
    vim.cmd('FlutterRun --dart-define-from-file=.keys.json')
  else
    vim.cmd('FlutterRun')
  end
end
