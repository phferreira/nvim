 function DoPrettyXML()
  vim.cmd('set ft=xml')
  vim.cmd(':0')
  vim.cmd(':silent! %s/> *</>\r</g')
  vim.cmd(':0')
  vim.cmd(':normal gg=G')
end

vim.cmd('command! PrettyXML execute \'lua DoPrettyXML()\'')
