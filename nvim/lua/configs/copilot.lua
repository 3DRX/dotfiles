local auth_file = vim.fn.stdpath("config") .. "/../github-copilot/apps.json"
auth_file = vim.fs.normalize(auth_file)
local has_auth = vim.fn.filereadable(auth_file) == 1

require("copilot").setup({
	panel = {
		enabled = has_auth,
		auto_refresh = has_auth,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "right",
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = has_auth,
		auto_trigger = has_auth,
		debounce = 75,
		keymap = {
			accept = "<Right>",
			accept_word = false,
			accept_line = false,
			next = "<M-Up>",
			prev = "<M-Down>",
			dismiss = "<M-c>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	server_opts_overrides = {
		enabled = false,
	},
	copilot_node_command = "node",
})
