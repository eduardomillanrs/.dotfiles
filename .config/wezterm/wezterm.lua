local wezterm                    = require("wezterm")
local config                     = wezterm.config_builder()

-- Colorscheme
config.color_scheme              = "iceberg-dark"

-- Font
config.font                      = wezterm.font("JetBrains Mono")
config.font_size                 = 16

-- Window
config.window_close_confirmation = "NeverPrompt"
config.window_padding            = {
    left   = 0,
    right  = 0,
    top    = 0,
    bottom = 0,
}

-- Tab bar
config.enable_tab_bar            = false

-- Keybinding
config.keys                      = {
    {
        key = "Enter",
        mods = "ALT",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = ",",
        mods = "CTRL",
        action = wezterm.action.SendKey { key = "^", mods = "CTRL" },
    },
}

return config
