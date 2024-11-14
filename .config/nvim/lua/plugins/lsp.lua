local lspconfig = require("lspconfig")

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>gf', function()
			vim.lsp.buf.format { async = true }
		end, opts)
		vim.keymap.set('n', '<leader>gi', function()
			print "organizing imports, please wait..."
			vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
		end)
	end,
})

lspconfig.gopls.setup({
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = false,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = false,
			},
		},
	},
})

vim.lsp.handlers['textDocument/completion'] = function(err, result, ctx, config)
	print(vim.inspect(result))
	-- Optionally call the default handler to avoid breaking completion
	vim.lsp.handlers['textDocument/completion'](err, result, ctx, config)
end
