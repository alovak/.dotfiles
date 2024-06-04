vim.g.mapleader = ","
vim.api.nvim_set_option("clipboard","unnamed") 

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
