-- This is not a required setup for NvChad/minty,
-- this exists just because I normally use neovim
-- with mouse disabled. So I need a way to enable
-- mouse when I'm using minty.

local function toggle_mouse()
	if vim.o.mouse == "" then
		vim.o.mouse = "a"
		vim.notify("Mouse mode enabled", vim.log.levels.INFO)
	else
		vim.o.mouse = ""
		vim.notify("Mouse mode disabled", vim.log.levels.INFO)
	end
end

vim.keymap.set("n", "<leader>ss", ":Shades<CR>", { noremap = true, silent = true, desc = "Toggle Shades" })
vim.keymap.set("n", "<leader>hh", ":Huefy<CR>", { noremap = true, silent = true, desc = "Toggle Huefy" })
vim.keymap.set("n", "<leader>mm", toggle_mouse, { noremap = true, silent = true, desc = "Toggle mouse mode" })
