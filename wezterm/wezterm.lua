local wezterm = require 'wezterm'
-- local mux = wezterm.mux
-- local io = require 'io'
-- local os = require 'os'


--------------------------------------------------------------------------------
--                                                                            --
--                        UTILITY FUNCTIONS                                   --
--                                                                            --
--------------------------------------------------------------------------------

-- OPEN WEZTERM CONFIG ON AN OTHER WINDOW
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

--------------------------------------------------------------------------------
--                                                                            --
--                         STARTUP FUNCTION                                   --
--                                                                            --
--------------------------------------------------------------------------------

wezterm.on('gui-startup', function(_) -- hidden cmd
end)

--------------------------------------------------------------------------------
--                                                                            --
--                         ACTUAL CONFIGURATION                               --
--                                                                            --
--------------------------------------------------------------------------------

local conf = {
  window_decorations = 'TITLE|RESIZE',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  initial_cols = 90,
  initial_rows = 40,
  font_dirs = { wezterm.executable_dir .. "/fonts" },
  font = wezterm.font('Fira Code'),
  font_size = 10,
  cell_width = 1.0,
  -- color_scheme = "Slate",
  color_scheme = "Gruvbox Dark",
  -- color_scheme = "Blazer",
  default_prog = { "pwsh" },
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.90,
  window_close_confirmation = "NeverPrompt",
  exit_behavior = "Close",
  max_fps = 30,
  keys = {
    -- { key = "e", mods = "CTRL", action = wezterm.action.EmitEvent 'trigger-vim-with-visible-text' },
    { key = "ì", mods = "CTRL", action = wezterm.action { SendString = "~" } },
    { key = "'", mods = "CTRL", action = wezterm.action { SendString = "`" } },
    { key = "!", mods = "CTRL|SHIFT|ALT", action = ewc_command },
    -- { key = " ", mods = "CTRL", action = wezterm.action.Multiple {
    --   wezterm.action.SendKey {key = "x", mods = "CTRL"},
    --   wezterm.action.SendKey {key = "o", mods = "CTRL"},
    -- }},
  },
  debug_key_events = true,
  enable_csi_u_key_encoding = true,
}

return conf
