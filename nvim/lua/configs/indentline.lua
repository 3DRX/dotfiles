vim.api.nvim_set_hl(0, "IblScope", { fg = "#54546d" })

require("ibl").setup({
	indent = {
		char = "╎",
	},
	scope = {
		highlight = "IblScope",
	},
})
