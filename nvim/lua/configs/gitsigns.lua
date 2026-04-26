require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = ">" },
		delete = { text = "-" },
		topdelete = { text = "^" },
		changedelete = { text = "<" },
		untracked = { text = "+" },
	},
	signcolumn = true,
})

vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
	end,
})
