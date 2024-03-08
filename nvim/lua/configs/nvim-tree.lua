require("nvim-tree").setup({
	sort_by = "name",
	hijack_unnamed_buffer_when_opening = true,
	renderer = {
		group_empty = true,
	},
	filters = {
		git_ignored = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	local directory = vim.fn.isdirectory(data.file) == 1
	if not no_name and not directory then
		return
	end
	if directory then
		vim.cmd.cd(data.file)
	end
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
