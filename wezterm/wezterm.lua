local wezterm = require 'wezterm'

--------------------------------------------------------------------------------
--                                                                            --
--                         GLOBAL VARIABLES                                   --
--                                                                            --
--------------------------------------------------------------------------------

show_tabs = false
color_schemes = {
   dark = {
      monokai = "Monokai Remastered",
      gruvbox = "Gruvbox dark, hard (base16)",
      blazer = "Blazer",
      slate = "Slate",
   },
   light = {
      material = "Material",
      man_page = "Man Page",
      github = "Github (base16)",
   },
}

--------------------------------------------------------------------------------
--                                                                            --
--                        UTILITY FUNCTIONS                                   --
--                                                                            --
--------------------------------------------------------------------------------

-- OPEN WEZTERM CONFIG ON AN OTHER WINDOW
local ewc_command = wezterm.action.SpawnCommandInNewWindow {
   label = 'Edit wezterm config',
   args = { 'runemacs', wezterm.config_file },
}

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

wezterm.on('update-right-status', function(window, pane)
	      local name = window:active_key_table()
	      if name then
		 name = 'TABLE: ' .. name
	      end
	      window:set_right_status(name or '')
end)

wezterm.on('toggle-tabs', function(window, pane)
	      conf.enable_tab_bar = not conf.enable_tab_bar
end)


--------------------------------------------------------------------------------
--                                                                            --
--                        KEYBINDS AND KEY TABLES                             --
--                                                                            --
--------------------------------------------------------------------------------
local keys = {
   { key = "ì", mods = "LEADER", action = wezterm.action { SendString = "~" } },
   { key = "'", mods = "LEADER", action = wezterm.action { SendString = "`" } },
   { key = "c", mods = "LEADER", action = ewc_command },
   { key = "e", mods = "LEADER", action = wezterm.action.ActivateKeyTable {
	name = 'edit_pane',
	one_shot = false,
	timeout_milliseconds = 3000,
   } },
   { key = "a", mods = "LEADER", action = wezterm.action.ActivateKeyTable {
	name = "activate_pane",
	timeout_milliseconds = 500,
   } },
   { key = "t", mods = "LEADER",
     action = wezterm.action.EmitEvent 'terminal-spawn' },
   -- { key = " ", mods = "CTRL", action = wezterm.action.Multiple {
   --   wezterm.action.SendKey {key = "x", mods = "CTRL"},
   --   wezterm.action.SendKey {key = "o", mods = "CTRL"},
   -- }},
   { key = 'LeftArrow',
     mods = "LEADER",
     action = wezterm.action.ActivatePaneDirection 'Left' },
   { key = 'RightArrow',
     mods = "LEADER",
     action = wezterm.action.ActivatePaneDirection 'Right' },
   { key = 'UpArrow',
     mods = "LEADER",
     action = wezterm.action.ActivatePaneDirection 'Up' },
   { key = 'DownArrow',
     mods = "LEADER",
     action = wezterm.action.ActivatePaneDirection 'Down' },
   { key = 'v',
     mods = "LEADER",
     action = wezterm.action.SplitPane { direction = "Right" }, },
   { key = 's',
     mods = "LEADER",
     action = wezterm.action.SplitPane { direction = "Down" }, },
   { key = 'd',
     mods = "LEADER",
     action = wezterm.action.CloseCurrentPane { confirm = false } },

}

local key_tables = {
   edit_pane = {
      { key = 'LeftArrow',
	action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
      { key = 'h',
	action = wezterm.action.AdjustPaneSize { 'Left', 1 } },

      { key = 'RightArrow',
	action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
      { key = 'l',
	action = wezterm.action.AdjustPaneSize { 'Right', 1 } },

      { key = 'UpArrow',
	action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
      { key = 'k',
	action = wezterm.action.AdjustPaneSize { 'Up', 1 } },

      { key = 'DownArrow',
	action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
      { key = 'j',
	action = wezterm.action.AdjustPaneSize { 'Down', 1 } },

      { key = 't',
	action = wezterm.action.EmitEvent 'toggle-tabs' },
      
      { key = 'Escape',
	action = 'PopKeyTable' }, -- Cancel the mode by pressing escape
   },
   activate_pane = {
      { key = 'LeftArrow',
	action = wezterm.action.ActivatePaneDirection 'Left' },
      { key = 'h',
	action = wezterm.action.ActivatePaneDirection 'Left' },

      { key = 'RightArrow',
	action = wezterm.action.ActivatePaneDirection 'Right' },
      { key = 'l',
	action = wezterm.action.ActivatePaneDirection 'Right' },

      { key = 'UpArrow',
	action = wezterm.action.ActivatePaneDirection 'Up' },
      { key = 'k',
	action = wezterm.action.ActivatePaneDirection 'Up' },

      { key = 'DownArrow',
	action = wezterm.action.ActivatePaneDirection 'Down' },
      { key = 'j',
	action = wezterm.action.ActivatePaneDirection 'Down' },
   },
}

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
   enable_tab_bar = show_tabs,
   use_fancy_tab_bar = false,
   initial_cols = 90,
   initial_rows = 40,
   font_dirs = { wezterm.executable_dir .. "/fonts" },
   font = wezterm.font('JetBrains Mono'),
   font_size = 10,
   cell_width = 1.0,
   default_prog = { "pwsh" },
   warn_about_missing_glyphs = false,
   window_background_opacity = 1.0,
   window_close_confirmation = "NeverPrompt",
   exit_behavior = "Close",
   max_fps = 30,
   leader = { key = '\\', mods = 'ALT' },
   keys = keys,
   key_tables = key_tables,
   debug_key_events = true,
   enable_csi_u_key_encoding = true,
   color_scheme = color_schemes.dark["monokai"],
}

return conf
