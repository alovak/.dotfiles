local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')

  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=main', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {'folke/tokyonight.nvim'},
  {'catppuccin/nvim', name = "catppuccin", priority = 1000 },
  {'tpope/vim-vinegar'},
  {'tpope/vim-unimpaired'},
  {'tpope/vim-surround'},
  {'tpope/vim-eunuch'},
  {'tpope/vim-commentary'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-git'},
  {'/tpope/vim-abolish'},
  {'AndrewRadev/splitjoin.vim'},
  {'aserowy/tmux.nvim'},
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
	  "nvim-telescope/telescope-file-browser.nvim",
	  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
})

require("tmux").setup()

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    color_overrides = {
	    mocha = {
		    base = "#282c34",
		    -- blue = "#61afef",
		    yellow = "#e5c07b",
		    green = "#98c379",
		    red = "#e06c75",
		    -- text = "#b5c1f1",
		    text = "#dcdfe4",

		    rosewater = "#efc9c2",
		    flamingo = "#ebb2b2",
		    pink = "#f2a7de",
		    mauve = "#b889f4",
		    maroon = "#ea838c",
		    peach = "#f39967",
		    teal = "#78cec1",
		    sky = "#91d7e3",
		    sapphire = "#68bae0",
		    lavender = "#a0a8f6",
		    subtext1 = "#a6b0d8",
		    subtext0 = "#959ec2",
		    overlay2 = "#848cad",
		    overlay1 = "#717997",
		    overlay0 = "#63677f",
		    surface2 = "#505469",
		    surface1 = "#3e4255",
		    surface0 = "#2c2f40",
		    mantle = "#141620",
		    crust = "#0e0f16",
	    },
    },
})
