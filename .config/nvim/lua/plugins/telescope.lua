local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>co', builtin.quickfix, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})




local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
require("telescope").setup {
	defaults = {
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
			},
			n = {
				["<c-i>"] = action_layout.toggle_preview,
			},
		},
	},
	pickers = {
		buffers = {
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
			hijack_netrw = true,
			display_stat = false,
			mappings = {
				["i"] = {
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
vim.keymap.set('n', '<leader>e', filebrowser.file_browser, {})