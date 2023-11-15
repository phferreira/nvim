local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("gitcommit", {
	s("tar", {
		t('Tarefa: #'), i(1), t(" - "), i(2)
	})
})


