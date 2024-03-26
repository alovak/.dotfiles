local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>r', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>co', builtin.quickfix, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
	defaults = {
		scroll_strategy = "limit",
		-- layout
		layout_strategy = "bottom_pane",
		results_title = "",
		-- border = false,
		layout_config = {
			prompt_position = "bottom",
			bottom_pane = {
				height = 0.70,
			},
		},
		preview = {
			hide_on_startup = true
		},

		mappings = {
			i = {
				-- ["<esc>"] = actions.close,
				["<c-o>"] = actions.file_split,
				["<c-v>"] = actions.file_vsplit,
				["<c-i>"] = action_layout.toggle_preview,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["<c-i>"] = action_layout.toggle_preview,
			},
		},
	},
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_mru = true,
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				}
			}
		}
	},
	extensions = {
		file_browser = {
			-- theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			-- grouped = true,
			hijack_netrw = true,
			display_stat = false,
			disable_devicons = true,
			dir_icon = "",
			git_status = false,
			-- hidden = true,
			respect_gitignore = false,
			hide_parent_dir = true,
			prompt_path = true,
			mappings = {
				["i"] = {
					["<C-e>"] = fb_actions.create_from_prompt,
					["<C-w>"] = fb_actions.goto_parent_dir,
					["<C-o>"] = actions.file_split,
					["<C-v>"] = actions.file_vsplit,

					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
}


require("telescope").load_extension "file_browser"
local filebrowser = require "telescope".extensions.file_browser
vim.keymap.set('n', '<leader>r', function() filebrowser.file_browser({ path = vim.fn.expand('%:p:h') }) end)
vim.keymap.set('n', '<leader>f', filebrowser.file_browser, {})
