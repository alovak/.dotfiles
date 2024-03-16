vim.g.mapleader = ","
vim.api.nvim_set_option("clipboard","unnamed") 


require("init")

vim.cmd [[source ~/.config/nvim/vimrc]]

-- Set the color scheme.
-- vim.api.nvim_set_option("background", "light")
-- vim.cmd("colorscheme onehalf-lush")

-- Set the dark colorscheme
vim.api.nvim_set_option("background", "dark")
vim.cmd("colorscheme onehalf-lush-dark")
