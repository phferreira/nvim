local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('gitcommit', {
  s('tar', {
    t('Tarefa: #'), i(1), t(" - "), i(2)
  })
})


local mySnip = {
  s('todo', {
    t('// TODO: '), i(1), t(" - "), i(2)
  }),
  s('fix', {
    t('// FIX: '), i(1), t(" - "), i(2)
  }),
  s('hack', {
    t('// HACK: '), i(1), t(" - "), i(2)
  }),
  s('warn', {
    t('// WARN: '), i(1), t(" - "), i(2)
  }),
  s('perf', {
    t('// PERF: '), i(1), t(" - "), i(2)
  }),
  s('NOTE', {
    t('// NOTE: '), i(1), t(" - "), i(2)
  }),
  s('test', {
    t('// TEST: '), i(1), t(" - "), i(2)
  }),
}

ls.add_snippets('dart', mySnip)
ls.add_snippets('java', mySnip)
