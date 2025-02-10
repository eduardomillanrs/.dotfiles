local wezterm = require("wezterm")

wezterm.on("format-tab-title", function (tab)
    local is_active = tab.is_active
    local title     = tab.active_pane.title
    local index     = tab.tab_index + 1

    return {
        { Text = " " .. index .. ":" .. title .. (is_active and "*" or "") .. " " },
    }
end)

local module = {}

function module.apply_to_config(config)
    config.use_fancy_tab_bar              = false
    config.tab_bar_at_bottom              = true
    config.hide_tab_bar_if_only_one_tab   = true
    config.show_new_tab_button_in_tab_bar = false
end

return module
