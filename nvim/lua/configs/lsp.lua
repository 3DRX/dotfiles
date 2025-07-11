require("neodev").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local function on_attach(_, _)
	vim.cmd([[
    highlight! DiagnosticLineNrError guibg=#3b161e guifg=#b01e1e gui=bold
    highlight! DiagnosticLineNrWarn guibg=#3b2f1e guifg=#a16b1d gui=bold
    highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#1cbaba gui=bold
    highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#195dd1 gui=bold
    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]])
end
vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
	filetypes = { "c", "cpp", "cc", "C", "m", "h", "hpp" },
})
vim.lsp.config("ts_ls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.stdpath("data")
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"jsonls",
		"yamlls",
		"clangd",
	},
})

require("lspconfig.configs").protobuf_language_server = {
	default_config = {
		cmd = { "protobuf-language-server" },
		filetypes = { "proto" },
		root_dir = require("lspconfig.util").root_pattern(".git", ".git/", "build.bazel"),
		single_file_support = true,
	},
}
require("lspconfig").protobuf_language_server.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
--------------------------------------------

-- nvim-cmp
vim.opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

-- Lspsaga
require("lspsaga").setup({
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	ui = {
		border = "rounded",
		devicon = true,
		foldericon = true,
		title = true,
		expand = "",
		collapse = "",
		code_action = "💡",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		kind = nil,
		imp_sign = "󰳛 ",
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		preview_width = 0.4,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			expand_or_jump = "<CR>",
			quit = "q",
		},
	},
	finder = {
		default = "def+ref+imp+tyd",
		layout = "normal",
		keys = {
			shuttle = "[w",
			toggle_or_open = "<CR>",
			vsplit = "s",
			split = "i",
			tabe = "t",
			tabnew = "r",
			quit = { "q", "<ESC>" },
			close = "<ESC>",
		},
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>df", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "<leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<cr>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>ic", "<cmd>Lspsaga incoming_calls<CR>", opts)
vim.keymap.set("n", "<leader>oc", "<cmd>Lspsaga outgoing_calls<CR>", opts)
vim.keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline<CR>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.api.nvim_create_user_command("FF", function()
	vim.lsp.buf.format()
end, {})
