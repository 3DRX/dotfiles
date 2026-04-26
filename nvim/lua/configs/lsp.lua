require("lazydev").setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

local function setup_diagnostic_highlights()
	vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { bg = "#3b161e", fg = "#b01e1e", bold = true })
	vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { bg = "#3b2f1e", fg = "#a16b1d", bold = true })
	vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { bg = "#1E535D", fg = "#1cbaba", bold = true })
	vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { bg = "#1E205D", fg = "#195dd1", bold = true })

	vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticLineNrError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticLineNrWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticLineNrInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticLineNrHint" })
end

setup_diagnostic_highlights()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

local servers = { "jsonls", "yamlls", "clangd", "ts_ls" }

vim.lsp.config("jsonls", {
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
vim.lsp.config("yamlls", {
	capabilities = capabilities,
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
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
	filetypes = { "c", "cpp", "cc", "C", "m", "h", "hpp" },
})
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
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
vim.lsp.enable(servers)

if vim.fn.executable("xcrun") == 1 then
	local sourcekit = vim.trim(vim.fn.system("xcrun -f sourcekit-lsp"))
	if sourcekit ~= "" then
		vim.lsp.config("sourcekit", {
			capabilities = capabilities,
			cmd = { sourcekit },
		})
		vim.lsp.enable("sourcekit")
	end
end
--------------------------------------------

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
		layout = "float",
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
