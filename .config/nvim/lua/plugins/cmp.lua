local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
	})
})

-- setup vim-dadbod-completion for sql, mysql, and plsql in a loop
for _, ft in ipairs({ 'sql', 'mysql', 'plsql' }) do
	cmp.setup.filetype(ft, {
		sources = cmp.config.sources({
			{ name = 'vim-dadbod-completion' },
		}, {
			{
				name = 'buffer',
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end
				}
			}
		})
	})
end

-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	}),
-- 	matching = { disallow_symbol_nonprefix_matching = false }
-- })
