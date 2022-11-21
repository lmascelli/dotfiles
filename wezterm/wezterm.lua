local wezterm = require 'wezterm'
local io = require 'io'
local os = require 'os'

-- COLORSCHEME
local light_color_scheme = "Windows 95 Light (base16)"
local dark_color_scheme = "Colors (base16)"


-- local color_scheme = "Gruvbox Dark"
-- local color_scheme = "VSCodeLight+ (Gogh)"
local color_scheme = "Slate"
-- local color_scheme = "Colors (base16)"

local function dynamic_color_scheme()
  local time = os.date("*t", os.time())
  if (time.hour >= 9 and time.hour < 19) then
    color_scheme = light_color_scheme
  else
    color_scheme = dark_color_scheme
  end
end

-- EDIT WEZTERM CONFIG
local ewc_command = wezterm.action.SpawnCommandInNewWindow {
  label = 'Edit wezterm config',
  args = { 'nvim', wezterm.config_file },
}

-- COPY TEXT FROM PANE VIEW
wezterm.on('trigger-vim-with-visible-text', function(window, pane)
  local viewport_text = pane:get_lines_as_text()
  local name = os.tmpname()
  local f = io.open(name, 'w+')
  if f then
    f:write(viewport_text)
    f:flush()
    f:close()
  end

  window:perform_action(
    wezterm.action.SpawnCommandInNewWindow {
      args = { 'nvim', name },
    },
    pane
  )

  wezterm.sleep_ms(1000)
  os.remove(name)
end
)


local powershell = "pwsh"


-- ACTUAL CONFIGURATION
return {
  window_decorations = 'TITLE|RESIZE',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  initial_cols = 90,
  initial_rows = 40,
  font_dirs = { wezterm.executable_dir .. "/fonts" },
  font = wezterm.font('FiraCode NF'),
  font_size = 10,
  cell_width = 1.0,
  color_scheme = color_scheme,
  default_prog = { powershell },
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.95,
  window_close_confirmation = "NeverPrompt",
  exit_behavior = "Close",
  max_fps = 30,
  keys = {
    -- { key = "Space", mods = "CTRL", action = {
    --   Multiple = {
    --     { SendKey = { key = "x", mods = "CTRL" } },
    --     { SendKey = { key = "o", mods = "CTRL" } },
    --   }
    -- } },
    -- { key = "e", mods = "CTRL", action = wezterm.action.EmitEvent 'trigger-vim-with-visible-text' },
    { key = "ì", mods = "CTRL", action = wezterm.action { SendString = "~" } },
    { key = "'", mods = "CTRL", action = wezterm.action { SendString = "`" } },
    { key = "!", mods = "CTRL|SHIFT|ALT", action = ewc_command },
  },
  debug_key_events = true,
  enable_csi_u_key_encoding = true,
}
