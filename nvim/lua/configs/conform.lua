local prettier = { "prettier" }
local rustfmt = { "rustfmt" }
local ruff_format = { "ruff_format" }
local clang_format = { "clang_format" }
local stylua = { "stylua" }
local gofmt = { "gofumpt" }

require("conform").setup({
	formatters_by_ft = {
		javascript = prettier,
		typescript = prettier,
		astro = prettier,
		css = prettier,
		html = prettier,
		typescriptreact = prettier,
		javascriptreact = prettier,
		python = ruff_format,
		c = clang_format,
		cpp = clang_format,
		go = gofmt,
		rust = rustfmt,
		lua = stylua,
	},
})

vim.api.nvim_create_user_command("F", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = false, range = range })
end, { range = true })
