local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local my_font = wezterm.font('Hack Nerd Font')

config.term = 'wezterm'
config.color_scheme = "jwj-theme"
config.font = my_font
config.font_size = 14

config.enable_scroll_bar = true
config.min_scroll_bar_height = 32

config.front_end = 'WebGpu'
config.window_background_opacity = 0.95
config.window_frame = {
    font = my_font,
    font_size = 12,
}

config.scrollback_lines = 10000
config.default_cursor_style = 'SteadyBar'

return config