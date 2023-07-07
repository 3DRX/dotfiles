local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Tango (terminal.sexy)'
config.colors = {
    foreground = "#ffffff",
    background = "#000000",
}
config.cursor_blink_rate = 0
config.font = wezterm.font("DejaVuSansM Nerd Font Mono", { weight = "Regular" })
config.font_size = 18.0
config.keys = {
    { key = "c", mods = "ALT", action = wezterm.action { CopyTo = "Clipboard" } },
    { key = "v", mods = "ALT", action = wezterm.action { PasteFrom = "Clipboard" } },
    { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab { confirm = false } },
}
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
    inactive_titlebar_bg = '#000000',
    active_titlebar_bg = '#000000',
    inactive_titlebar_fg = '#ffffff',
    active_titlebar_fg = '#ffffff',
    inactive_titlebar_border_bottom = '#000000',
    active_titlebar_border_bottom = '#000000',
    button_fg = '#ffffff',
    button_bg = '#000000',
    button_hover_fg = '#ffffff',
    button_hover_bg = '#000000',
    border_left_width = '0.0cell',
    border_right_width = '0.0cell',
    border_bottom_height = '0.0cell',
    border_top_height = '0.0cell',
    border_left_color = '#000000',
    border_right_color = '#000000',
    border_bottom_color = '#000000',
    border_top_color = '#000000',
}
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = false

-- some hack to fix cursor missing under wayland
local function gsettings(key)
    return wezterm.run_child_process({ "gsettings", "get", "org.gnome.desktop.interface", key })
end
local function apply_to_config(conf)
    if wezterm.target_triple ~= "x86_64-unknown-linux-gnu" then
        -- skip if not running on linux
        return
    end
    local success, stdout, stderr = gsettings("cursor-theme")
    if success then
        conf.xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
    end
    local success, stdout, stderr = gsettings("cursor-size")
    if success then
        conf.xcursor_size = tonumber(stdout)
    end
    config.enable_wayland = true
    if conf.enable_wayland and os.getenv("WAYLAND_DISPLAY") then
        local success, stdout, stderr = gsettings("text-scaling-factor")
        if success then
            conf.font_size = (conf.font_size or 10.0) * tonumber(stdout)
        end
    end
end
apply_to_config(config)

return config
