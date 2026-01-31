local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- system settings
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
config.default_cwd = "C:\\"
config.front_end = "WebGpu"

-- layout and desgin
config.window_decorations = "RESIZE"
config.initial_rows = 30
config.initial_cols = 120
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.95
config.window_padding = { left = 0, top = 0 }
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.6 } -- emphasize active pane

-- tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.window_close_confirmation = 'NeverPrompt'

-- fonts
config.font_size = 10.0
config.font = wezterm.font_with_fallback {
    { family = "JetBrainsMono Nerd Font", weight = "Medium" },
    "D2Coding",
    "Noto Color Emoji",
}

-- key bindings
config.keys = {
    {key="w", mods="CTRL", action=wezterm.action.CloseCurrentPane{confirm=false}},
    {key="t", mods="CTRL", action=wezterm.action.SpawnTab("DefaultDomain")},
--    {key="h", mods="CTRL|SHIFT", action=wezterm.action.ActivateTabRelative(-1)},
--    {key="l", mods="CTRL|SHIFT", action=wezterm.action.ActivateTabRelative(1)},
    
    {key="Backspace", mods="CTRL", action=wezterm.action.SendString("\x17")},
    {key = "\\", mods = "CTRL", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },},
}
-- move tab by ctrl + 1~9
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "CTRL",
        action = wezterm.action.ActivateTab(i - 1),
    })
end

return config
