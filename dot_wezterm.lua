-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 17
config.font = wezterm.font "Ricty Diminished for Powerline"

config.color_scheme = 'Sonokai (Gogh)'

config.audible_bell = "Disabled"

-- Some other good themes.
-- config.color_scheme = "OneHalfDark"
-- These themes have compose_cursor colors defined, so IME highlights work out of the box.
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Dracula (Official)'

-- The default behavior for text being editted in IME shows up as white on
-- white background, making it impossible to read.
-- Catppuccin Mocha gets it kinda write (tho still bright color on bright).
-- The following snippet is borrowed from Catppuccin Mocha.
-- https://github.com/wez/wezterm/blob/e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8/docs/colorschemes/data.json#L6613
-- Note:
--  * it has a bunch of settings to make the highlighted text in IME to show up
--    in different color. Not sure which lines are absolutely necessary but this
--    seems to be good enough.
--  * cursor_bg field overwrites the original themes cursor color. Comment out
--    at your preference.
--  * jq query to find color schemes that have compose_cursor
--    `jq ".[] | select(.colors.compose_cursor) | .metadata.name" data.json`
local ime_cursor_highlight_dict = {
    -- Uses black (text) on pastel pink (background).
    -- Taken from Catppuccin Mocha theme.
    pink = {
        compose_cursor = "#f2cdcd",
        cursor_bg = "#f5e0dc",
        cursor_border = "#f5e0dc",
        cursor_fg = "#11111b",
        foreground = "#cdd6f4",
        indexed = {
            [16] = "#fab387",
            [17] = "#f5e0dc"
        },
        scrollbar_thumb = "#585b70",
        selection_bg = "#585b70",
        selection_fg = "#cdd6f4",
        split = "#6c7086"
    },
    -- Uses black on darker pink.
    -- Taken from Poimandres theme.
    dark_pink = {
        compose_cursor = "#fcc5e9",
        cursor_bg = "#a6accd",
        cursor_border = "#a6accd",
        cursor_fg = "#1b1e28",
        foreground = "#e4f0fb",
        indexed = {
            [16] = "#5de4c7",
            [17] = "#d0679d"
        },
        scrollbar_thumb = "#303340",
        selection_bg = "#506477",
        selection_fg = "#e4f0fb",
        split = "#171922"
    },
    -- black on orange.
    -- Taken from nightfox.
    orange = {
        compose_cursor = "#f4a261",
        cursor_bg = "#cdcecf",
        cursor_border = "#cdcecf",
        cursor_fg = "#192330",
        foreground = "#cdcecf",
        indexed = {
            [16] = "#d67ad2",
            [17] = "#f4a261"
        },
        scrollbar_thumb = "#71839b",
        selection_bg = "#2b3b51",
        selection_fg = "#cdcecf",
        split = "#131a24"
    },
    -- Another simple solution is to use a background that is different from
    -- the text color.
    grey = {
        cursor_bg = "rgba(50% 50% 50%)"
    }
}

config.colors = ime_cursor_highlight_dict["dark_pink"]

config.default_cursor_style = 'SteadyUnderline'

-- Cmd-q will not prompt anymore.
config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
