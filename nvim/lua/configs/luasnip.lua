local ls = require("luasnip")
-- <Ctrl-Right> for jumping forward,
-- <Ctrl-Left> for jumping backward,
-- <Ctrl-Up> for changing the active choice.
vim.keymap.set({ "i", "s" }, "<C-Right>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-Left>", function()
	ls.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-Up>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
-- require("luasnip.loaders.from_vscode").lazy_load()
