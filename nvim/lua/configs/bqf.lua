require("bqf").setup({
	auto_enable = true,
	auto_resize_height = true,
	preview = {
		win_height = 8,
		win_vheight = 8,
		delay_syntax = 80,
		border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		show_title = false,
		should_preview_cb = function(bufnr, _)
			local ret = true
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			local fsize = vim.fn.getfsize(bufname)
			if fsize > 100 * 1024 then
				-- skip file size greater than 100k
				ret = false
			elseif bufname:match("^fugitive://") then
				-- skip fugitive buffer
				ret = false
			end
			return ret
		end,
	},
	func_map = {
		drop = "o",
		openc = "O",
		split = "<C-s>",
		tabdrop = "<C-t>",
		tabc = "",
		ptogglemode = "z,",
	},
	filter = {
		fzf = {
			action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
			extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
		},
	},
})
