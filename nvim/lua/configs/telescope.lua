require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"__venv__",
		},
		mappings = {
			i = {},
		},
	},
	pickers = {},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		undo = {
			use_delta = true,
			use_custom_command = nil,
			side_by_side = false,
			diff_context_lines = vim.o.scrolloff,
			entry_format = "state #$ID, $STAT, $TIME",
			time_format = "",
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
					["<C-cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.git_commits, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>")
