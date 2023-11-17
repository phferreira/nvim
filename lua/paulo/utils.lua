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

