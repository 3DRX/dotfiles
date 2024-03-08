require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"vim",
		"lua",
		"gitignore",
		"c",
		"cpp",
		"cmake",
		"csv",
		"ninja",
		"rust",
		"python",
		"bash",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-n>",
			node_incremental = "<C-n>",
			scope_incremental = false,
			node_decremental = "<C-m>",
		},
	},
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	disable_in_macro = true, -- disable when recording or executing a macro
	disable_in_visualblock = false, -- disable when insert after visual block mode
	disable_in_replace_mode = true,
	ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
	enable_moveright = true,
	enable_afterquote = true, -- add bracket pairs after quote
	enable_check_bracket_line = true, --- check bracket in same line
	enable_bracket_in_quote = true, --
	enable_abbr = false, -- trigger abbreviation
	break_undo = true, -- switch for basic rule break undo sequence
	check_ts = true,
	map_cr = true,
	map_bs = true, -- map the <BS> key
	map_c_h = false, -- Map the <C-h> key to delete a pair
	map_c_w = false, -- map <c-w> to delete a pair if possible
})
