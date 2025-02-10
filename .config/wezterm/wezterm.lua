local wezterm                                     = require("wezterm")
local tabs                                        = require("tabs")
local keymaps                                     = require("keymaps")

local config                                      = wezterm.config_builder()

-- Color scheme
config.force_reverse_video_cursor                 = true
config.color_scheme                               = "Kanagawa Dragon"

-- Font
config.font                                       = wezterm.font("JetBrains Mono")
config.font_size                                  = 15

-- Window
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation                  = "NeverPrompt"
config.window_padding                             = {
    left   = 0,
    right  = 0,
    top    = 0,
    bottom = 0,
}

-- Apply to config
tabs.apply_to_config(config)
keymaps.apply_to_config(config)

return config
