vim.g.mapleader = ","
vim.api.nvim_set_option("clipboard","unnamed") 

vim.cmd [[source ~/.config/nvim/vimrc]]

require("init")

vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin')
-- vim.cmd.colorscheme('tokyonight')

