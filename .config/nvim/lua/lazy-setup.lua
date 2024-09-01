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
  {
	  "CodeGradox/onehalf-lush",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  vim.api.nvim_set_option("background", "dark")
		  vim.cmd("colorscheme onehalf-lush")
	  end
  },
  {'tpope/vim-vinegar'},
  {'tpope/vim-unimpaired'},
  {'tpope/vim-surround'},
  {'tpope/vim-eunuch'},
  {'tpope/vim-commentary'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-git'},
  {'tpope/vim-abolish'},
  {'github/copilot.vim'},
  {'AndrewRadev/splitjoin.vim'},
  {'alexghergh/nvim-tmux-navigation'},
  {'ruanyl/vim-gh-line'},
  {'lewis6991/gitsigns.nvim'},
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {'nvim-treesitter/nvim-treesitter-context'},
  {
	  "nvim-telescope/telescope-file-browser.nvim",
	  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
	  "nvim-treesitter/nvim-treesitter",
	  build = ":TSUpdate",
  },
  {"nvim-treesitter/nvim-treesitter-textobjects"},
  {'EtiamNullam/vim-todotxt-syntax'},
  -- {'/fatih/vim-go'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'preservim/tagbar'},

  -- Autocompletion
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},
  {'sindrets/diffview.nvim'},
  { 'j-hui/fidget.nvim'},
  {
	  'kristijanhusak/vim-dadbod-ui',
	  dependencies = {
		  { 'tpope/vim-dadbod', lazy = true },
		  { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
	  },
	  cmd = {
		  'DBUI',
		  'DBUIToggle',
		  'DBUIAddConnection',
		  'DBUIFindBuffer',
	  },
	  init = function()
		  -- Your DBUI configuration
		  vim.g.db_ui_use_nerd_fonts = 1
	  end,
  },
})
