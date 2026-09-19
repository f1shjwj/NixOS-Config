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

    color_schemes = {
        ['jwj-theme'] = {
            background = '#1e1e1e',
            foreground = '#d4d4d4',
            cursor_bg = '#00d1ff',
            selection_bg = '#3a3d41',
            ansi = {
                '#1e1e1e', '#f44747', '#4ec9b0', '#d7ba7d',
                '#4fc1ff', '#ff79c6', '#9cdcfe', '#d4d4d4',
            },
            brights = {
                '#808080', '#f44747', '#4ec9b0', '#d7ba7d',
                '#4fc1ff', '#ff79c6', '#9cdcfe', '#ffffff',
            },
        },
    },
}

return config
