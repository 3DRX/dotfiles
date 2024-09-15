require("kanagawa").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = {
			wave = {
				ui = {
					bg = "none",
					float = {
						bg = "black",
					},
				},
			},
			lotus = {},
			dragon = {},
			all = {},
		},
	},
	theme = "wave",
	background = {
		dark = "wave",
		light = "lotus",
	},
})
vim.cmd("set background=dark")
vim.cmd("colorscheme kanagawa")

-- vim.cmd("set background=light")
-- vim.cmd("colorscheme zenbones")
