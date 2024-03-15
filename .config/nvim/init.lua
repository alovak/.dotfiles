vim.g.mapleader = ","
vim.api.nvim_set_option("clipboard","unnamed") 

vim.cmd [[source ~/.config/nvim/vimrc]]

require("init")

vim.opt.termguicolors = true

-- Set the color scheme.
-- vim.api.nvim_set_option("background", "light")
-- vim.cmd("colorscheme onehalf-lush")

-- Set the dark colorscheme
vim.api.nvim_set_option("background", "dark")
vim.cmd("colorscheme onehalf-lush-dark")
