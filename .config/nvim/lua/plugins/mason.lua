require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls" },
})

require("lspconfig").lua_ls.setup {}
