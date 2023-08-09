-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#000000" .. alpha()
vim.o.guifont = "DejaVuSansMono Nerd Font:h18"
vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.o.mouse = "a"
vim.g.neovide_hide_mouse_when_typing = true
