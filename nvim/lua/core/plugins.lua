local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("Failed to clone lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("configs.nvim-tree")
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("configs.lualine")
			end,
		},
		"rebelot/kanagawa.nvim",
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("configs.gitsigns")
			end,
		},
		"tpope/vim-fugitive",
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			config = function()
				require("configs.indentline")
			end,
		},
		"nvim-lua/plenary.nvim",
		{
			"zbirenbaum/copilot.lua",
			config = function()
				require("configs.copilot")
			end,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("configs.treesitter").setup_autopairs()
			end,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"b0o/schemastore.nvim",
				"folke/lazydev.nvim",
				"nvimdev/lspsaga.nvim",
			},
			config = function()
				require("configs.lsp")
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("configs.luasnip")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			build = ":TSUpdate",
			config = function()
				require("configs.treesitter").setup()
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("configs.treesitter").setup_autotag()
			end,
		},
		{
			"numToStr/Comment.nvim",
			config = function()
				require("configs.comment")
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
			branch = "master",
			dependencies = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
				"debugloop/telescope-undo.nvim",
				"rcarriga/nvim-notify",
			},
			config = function()
				require("configs.telescope")
			end,
		},
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("configs.harpoon")
			end,
		},
		{
			"catgoose/nvim-colorizer.lua",
			config = function()
				require("configs.colorizer")
			end,
		},
		"NvChad/volt",
		{
			"NvChad/minty",
			dependencies = { "NvChad/volt" },
			config = function()
				require("configs.minty")
			end,
		},
		"lervag/vimtex",
		{
			"kevinhwang91/nvim-bqf",
			config = function()
				require("configs.bqf")
			end,
		},
		{
			"stevearc/conform.nvim",
			config = function()
				require("configs.conform")
			end,
		},
		{
			"folke/noice.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			config = function()
				require("configs.noice")
			end,
		},
		"tpope/vim-sleuth",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		{
			"HakonHarnes/img-clip.nvim",
			config = function()
				require("configs.imgclip")
			end,
		},
		"folke/snacks.nvim",
		{
			"wojciech-kulik/xcodebuild.nvim",
			cond = vim.fn.has("mac") == 1,
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("configs.xcodebuild")
			end,
		},
		{
			"davidmh/mdx.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("configs.mdx")
			end,
		},
	},
	install = {
		colorscheme = { "kanagawa" },
	},
	checker = {
		enabled = false,
	},
	change_detection = {
		notify = false,
	},
})

require("configs.colorscheme")
