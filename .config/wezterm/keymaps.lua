local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    config.disable_default_key_bindings = true
    config.leader                       = { key = ",", mods = "CTRL", timeout_milliseconds = 1000 }

    config.keys                         = {
        { key = "Enter", mods = "ALT",        action = wezterm.action.DisableDefaultAssignment },

        { key = "c",     mods = "CMD",        action = wezterm.action.CopyTo("Clipboard") },
        { key = "v",     mods = "CMD",        action = wezterm.action.PasteFrom("Clipboard") },

        { key = "n",     mods = "CMD",        action = wezterm.action.SpawnWindow },

        { key = "+",     mods = "CMD",        action = wezterm.action.IncreaseFontSize },
        { key = "-",     mods = "CMD",        action = wezterm.action.DecreaseFontSize },
        { key = "0",     mods = "CMD",        action = wezterm.action.ResetFontSize },

        { key = "w",     mods = "CMD",        action = wezterm.action.CloseCurrentTab({ confirm = false }) },
        { key = "q",     mods = "CMD",        action = wezterm.action.CloseCurrentPane({ confirm = false }) },

        { key = "m",     mods = "CMD",        action = wezterm.action.Hide },
        { key = "h",     mods = "CMD",        action = wezterm.action.HideApplication },

        -- { key = "f",     mods = "CMD",       action = wezterm.action.Search({ CaseSensitiveString = "" }) },

        { key = "c",     mods = "LEADER",     action = wezterm.action.SpawnTab("CurrentPaneDomain") },
        { key = "x",     mods = "LEADER",     action = wezterm.action.CloseCurrentTab({ confirm = true }) },

        { key = "n",     mods = "LEADER",     action = wezterm.action.ActivateTabRelative(1) },
        { key = "p",     mods = "LEADER",     action = wezterm.action.ActivateTabRelative(-1) },

        { key = "1",     mods = "LEADER",     action = wezterm.action.ActivateTab(0) },
        { key = "2",     mods = "LEADER",     action = wezterm.action.ActivateTab(1) },
        { key = "3",     mods = "LEADER",     action = wezterm.action.ActivateTab(2) },
        { key = "4",     mods = "LEADER",     action = wezterm.action.ActivateTab(3) },
        { key = "5",     mods = "LEADER",     action = wezterm.action.ActivateTab(4) },
        { key = "6",     mods = "LEADER",     action = wezterm.action.ActivateTab(5) },
        { key = "7",     mods = "LEADER",     action = wezterm.action.ActivateTab(6) },
        { key = "8",     mods = "LEADER",     action = wezterm.action.ActivateTab(7) },

        { key = "h",     mods = "LEADER",     action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "l",     mods = "LEADER",     action = wezterm.action.ActivatePaneDirection("Right") },
        { key = "k",     mods = "LEADER",     action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "j",     mods = "LEADER",     action = wezterm.action.ActivatePaneDirection("Down") },

        { key = "h",     mods = "SHIFT|META", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
        { key = "l",     mods = "SHIFT|META", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
        { key = "k",     mods = "SHIFT|META", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
        { key = "j",     mods = "SHIFT|META", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

        { key = "\"",    mods = "LEADER",     action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "%",     mods = "LEADER",     action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

        { key = "z",     mods = "LEADER",     action = wezterm.action.TogglePaneZoomState },

        { key = "r",     mods = "CMD",        action = wezterm.action.ReloadConfiguration },

        { key = "d",     mods = "CMD|SHIFT",  action = wezterm.action.ShowDebugOverlay },
    }
end

return module
