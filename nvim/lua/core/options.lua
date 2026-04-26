vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.scrolloff = 200
opt.autoindent = true
opt.smarttab = true
opt.incsearch = true
opt.showmatch = true
opt.hlsearch = false
opt.matchtime = 5
opt.wrap = false
opt.ignorecase = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 50
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.mouse = ""
opt.encoding = "UTF-8"
opt.fileencodings = { "ucs-bom", "utf-8", "utf-16", "gbk", "big5", "gb18030", "latin1" }
opt.cmdheight = 0
opt.clipboard:append("unnamedplus")
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.background = "dark"

vim.cmd.syntax("enable")

vim.g.tex_flavor = "latex"
vim.g.vimtex_quickfix_mode = 1

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { ctermbg = 256 })
		vim.api.nvim_set_hl(0, "LineNr", {})
	end,
})

vim.api.nvim_set_hl(0, "Normal", { ctermbg = 256 })
vim.api.nvim_set_hl(0, "LineNr", {})
