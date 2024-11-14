vim.g.mapleader = ","
vim.api.nvim_set_option("clipboard", "unnamed")

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("plugins")

vim.cmd [[source ~/.config/nvim/vimrc]]

-- Set the color scheme.
-- vim.api.nvim_set_option("background", "light")
-- vim.cmd("colorscheme onehalf-lush")

-- Set the dark colorscheme
vim.api.nvim_set_option("background", "dark")
vim.cmd("colorscheme onehalf-lush-dark")

function ToggleBackground()
	if vim.o.background == "dark" then
		vim.api.nvim_set_option("background", "light")
		vim.cmd("colorscheme onehalf-lush")
	else
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme onehalf-lush-dark")
	end
end

vim.o.statusline = "%{fnamemodify(getcwd(),':t')} • %<%f %h%m%r%=%-14.(%l,%c%V%) %P"

local comment_hl = vim.api.nvim_get_hl_by_name('Comment', true)
-- Set 'LspInlayHint' to use the same values as 'Comment'
vim.api.nvim_set_hl(0, 'LspInlayHint', comment_hl)

-- vim.lsp.inlay_hint.enable()

-- local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--    require('go.format').goimports()
--   end,
--   group = format_sync_grp,
-- })
