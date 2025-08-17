local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local my_font = wezterm.font_with_fallback({
    'Hack Nerd Font',
    'Source Han Sans SC',
})

config = {
    term = 'wezterm',
    color_scheme = "jwj-theme",
    font = my_font,
    font_size = 12,
    enable_scroll_bar = true,
    min_scroll_bar_height = 32,
    use_ime = true,
    window_frame = {
        font = my_font,
        font_size = 10,
    },
    tab_max_width = 25,
    switch_to_last_active_tab_when_closing_tab = true,
    scrollback_lines = 10000,
    default_cursor_style = 'SteadyBar',
}

return config
