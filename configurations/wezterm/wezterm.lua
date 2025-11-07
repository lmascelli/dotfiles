local wezterm = require 'wezterm'

--------------------------------------------------------------------------------
--                                                                            --
--                         GLOBAL VARIABLES                                   --
--                                                                            --
--------------------------------------------------------------------------------

local color_schemes = {
  dark = {
    night = "3024 Night",
    monokai = "Monokai Remastered",
    gruvbox = "Gruvbox dark, hard (base16)",
    blazer = "Blazer",
    slate = "Slate",
    wombat = "Wombat",
    zenburn = "Zenburn (base16)"
  },
  light = {
    material = "Material",
    man_page = "Man Page",
    github = "Github (base16)",
    grass = "Grass",
    gray_scale = "Grayscale Light (base16)",
    gruvbox = "Gruvbox Light",
  },
}

-- local current_scheme = nil
local current_scheme = color_schemes.dark["wombat"]
-- local current_scheme = color_schemes.light["github"]
-- local current_scheme = "Borland"

local function program_exists(program)
  local handle = io.popen("command -v " .. program)
  if handle ~= nil then
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  else
    return nil
  end
end

local default_prog = function()
  if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    if program_exists("pwsh.exe") then
      return { "pwsh.exe" }
    else
      return { "powershell.exe" }
    end
  else
    if program_exists("pwsh") then
      return { "pwsh" }
    else
      return { "bash" }
    end
  end
end


--------------------------------------------------------------------------------
--                                                                            --
--                         STARTUP FUNCTION                                   --
--                                                                            --
--------------------------------------------------------------------------------

wezterm.on('gui-startup', function(_) -- hidden cmd
end)

--------------------------------------------------------------------------------
--                                                                            --
--                           EVENT FUNCTIONS                                  --
--                                                                            --
--------------------------------------------------------------------------------

-- DISPLAY THE CURRENT TABLE VALUE IN TAB PANEL
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)


-- WEZTERM ZEN_MODE.NVIM
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

--------------------------------------------------------------------------------
--                                                                            --
--                        KEYBINDS AND KEY TABLES                             --
--                                                                            --
--------------------------------------------------------------------------------

local keys = {
  { key = '1', mods = 'ALT',    action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'ALT',    action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'ALT',    action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'ALT',    action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'ALT',    action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'ALT',    action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'ALT',    action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'ALT',    action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'ALT',    action = wezterm.action.ActivateTab(8) },
  { key = '0', mods = 'ALT',    action = wezterm.action.ActivateTab(9) },
  -- { key = 'h', mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Left' },
  -- { key = 'l', mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Right' },
  -- { key = 'j', mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Down' },
  -- { key = 'k', mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Up' },

  { key = "ì", mods = "LEADER", action = wezterm.action { SendString = "~" } },
  { key = "'", mods = "LEADER", action = wezterm.action { SendString = "`" } },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnCommandInNewTab { args = { 'nvim', wezterm.config_file } }
  },
  {
    key = "e",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable {
      name = 'edit_pane',
      one_shot = false,
      timeout_milliseconds = 3000,
    }
  },
  {
    key = "a",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable {
      name = "activate_pane",
      timeout_milliseconds = 500,
    }
  },
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.EmitEvent 'terminal-spawn'
  },
  -- {
  --    key = "Tab",
  --    mods = "CTRL",
  --    action = wezterm.action.DisableDefaultAssignment,
  -- },
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action.SendKey { key = "Backspace", mods = "ALT"},
  },
  -- {
  --   key = "h",
  --   mods = "ALT",
  --   action = wezterm.action.ActivateTabRelative(-1),
  -- },
  -- {
  --   key = "l",
  --   mods = "ALT",
  --   action = wezterm.action.ActivateTabRelative(1),
  -- },
  -- {
  --   key = " ",
  --   mods = "CTRL",
  --   action = wezterm.action.Multiple {
  --     wezterm.action.SendKey { key = "_", mods = "CTRL" },
  --     -- wezterm.action.SendKey { key = "x", mods = "CTRL" },
  --     -- wezterm.action.SendKey { key = "o", mods = "CTRL" },
  --   }
  -- },
  {
    key = " ",
    mods = "SHIFT",
    action = wezterm.action.Multiple {
      wezterm.action.SendKey { key = " "},
      -- wezterm.action.SendKey { key = "x", mods = "CTRL" },
      -- wezterm.action.SendKey { key = "o", mods = "CTRL" },
    }
  },
  {
    key = 'LeftArrow',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'h',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'RightArrow',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  {
    key = 'l',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  {
    key = 'UpArrow',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'k',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'DownArrow',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = 'j',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = 'v',
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = 's',
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = 'd',
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = false }
  },
  {
    key = 'm',
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = 'LEADER',
    key = '0',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  }
}

local key_tables = {
  edit_pane = {
    {
      key = 'LeftArrow',
      action = wezterm.action.AdjustPaneSize { 'Left', 1 }
    },
    {
      key = 'h',
      action = wezterm.action.AdjustPaneSize { 'Left', 1 }
    },

    {
      key = 'RightArrow',
      action = wezterm.action.AdjustPaneSize { 'Right', 1 }
    },
    {
      key = 'l',
      action = wezterm.action.AdjustPaneSize { 'Right', 1 }
    },

    {
      key = 'UpArrow',
      action = wezterm.action.AdjustPaneSize { 'Up', 1 }
    },
    {
      key = 'k',
      action = wezterm.action.AdjustPaneSize { 'Up', 1 }
    },

    {
      key = 'DownArrow',
      action = wezterm.action.AdjustPaneSize { 'Down', 1 }
    },
    {
      key = 'j',
      action = wezterm.action.AdjustPaneSize { 'Down', 1 }
    },

    {
      key = 't',
      action = wezterm.action.EmitEvent 'toggle-tabs'
    },

    {
      key = 'Escape',
      action = 'PopKeyTable'
    }, -- Cancel the mode by pressing escape
  },
  activate_pane = {
    {
      key = 'LeftArrow',
      action = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
      key = 'h',
      action = wezterm.action.ActivatePaneDirection 'Left'
    },

    {
      key = 'RightArrow',
      action = wezterm.action.ActivatePaneDirection 'Right'
    },
    {
      key = 'l',
      action = wezterm.action.ActivatePaneDirection 'Right'
    },

    {
      key = 'UpArrow',
      action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
      key = 'k',
      action = wezterm.action.ActivatePaneDirection 'Up'
    },

    {
      key = 'DownArrow',
      action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
      key = 'j',
      action = wezterm.action.ActivatePaneDirection 'Down'
    },
  },
}

local MOUSE_SCROLL = 0.001

local mouse_bindings = {
  -- {
  --   event = { Down = { streak = 1, button = { WheelUp = 1 } } },
  --   mods = 'NONE',
  --   action = wezterm.action.SendKey { key = "UpArrow", mods = "NONE" },
  --   -- action = wezterm.action.ScrollByPage(-MOUSE_SCROLL),
  --   -- alt_screen = false,
  -- },
  -- {
  --   event = { Down = { streak = 1, button = { WheelDown = 1 } } },
  --   mods = 'NONE',
  --   action = wezterm.action.SendKey { key = "DownArrow", mods = "NONE" },
  --   -- action = wezterm.action.ScrollByPage(MOUSE_SCROLL),
  --   -- alt_screen = false,
  -- },
}

--------------------------------------------------------------------------------
--                                                                            --
--                         ACTUAL CONFIGURATION                               --
--                                                                            --
--------------------------------------------------------------------------------

local config = wezterm.config_builder()
config:set_strict_mode(true) -- config warnings are considered as errors

-- WINDOW BEHAVIOUR
config.window_decorations = 'TITLE|RESIZE'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
-- config.window_background_opacity = 0.95
config.front_end = 'OpenGL' -- alternatives: 'OpenGL', 'Software', 'WebGpu'
-- config.front_end = 'WebGpu' -- alternatives: 'OpenGL', 'Software', 'WebGpu'
-- config.front_end = 'Software' -- alternatives: 'OpenGL', 'Software', 'WebGpu'
config.max_fps = 30
config.color_scheme = current_scheme
------------------------------------

-- GEOMETRY
config.initial_cols = 110
config.initial_rows = 30
------------------------------------

-- FONT
config.cell_width = 1
config.font_size = 11
config.line_height = 1.2
config.font_dirs = { wezterm.config_dir .. "/fonts" }
config.warn_about_missing_glyphs = false
-- config.font = wezterm.font('NotoSansMono-Regular')	
-- config.font = wezterm.font('Perfect DOS VGA 437')
-- config.font = wezterm.font('Cascadia Code NF')
-- config.font = wezterm.font('CaskaydiaCove Nerd Font')
-- config.font = wezterm.font('Source Code Pro')
-- config.font = wezterm.font('JetBrains Mono NL')
-- config.font = wezterm.font('JetBrains Mono NF')
-- config.font = wezterm.font('Consolas')
------------------------------------

-- BEHAVIOUR
config.default_prog = default_prog()
config.window_close_confirmation = "NeverPrompt" -- "AlwaysPrompt"
config.exit_behavior = "Close"
config.enable_csi_u_key_encoding = true
config.audible_bell = "Disabled"
config.alternate_buffer_wheel_scroll_speed = 1
config.adjust_window_size_when_changing_font_size = false
-- config.debug_key_events = true
------------------------------------

-- KEYBINDINGS
config.leader = { key = '\\', mods = 'ALT' }
config.keys = keys
config.mouse_bindings = mouse_bindings
config.key_tables = key_tables
------------------------------------

config.set_environment_variables = {
  prompt = "$E]7;"
}

config.debug_key_events = true

return config
