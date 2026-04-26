local M = {}

local parser_install_dir = vim.fn.stdpath("data") .. "/nvim-treesitter-parsers-v0.12"

local languages = {
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
}

function M.setup()
	vim.opt.runtimepath:prepend(parser_install_dir)

	require("nvim-treesitter.configs").setup({
		parser_install_dir = parser_install_dir,
		ensure_installed = languages,
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
			disable = { "mdx" },
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { "mdx" },
		},
	})
end

function M.setup_autotag()
	require("nvim-ts-autotag").setup({
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = true,
		},
	})
end

function M.setup_autopairs()
	require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		disable_in_macro = true,
		disable_in_visualblock = false,
		disable_in_replace_mode = true,
		ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		enable_moveright = true,
		enable_afterquote = true,
		enable_check_bracket_line = true,
		enable_bracket_in_quote = true,
		enable_abbr = false,
		break_undo = true,
		check_ts = true,
		map_cr = true,
		map_bs = true,
		map_c_h = false,
		map_c_w = false,
	})
end

return M
