ui.tabs = false
buffer.use_tabs = false
buffer.tab_width = 2

view:set_theme('dark', {font = 'Cascadia Code', size = 10})
events.connect(events.INITIALIZED, function ()
	view.h_scroll_bar = false
	textadept.menu.menubar = nil
    end
)
view.h_scroll_bar = false

textadept.editing.autocomplete_all_words = true

local ok, ofm = pcall(require, 'open_file_mode')
if ok then
  keys['ctrl+o'] = ofm
end

local ok, fmt = pcall(require, 'format')
if ok then

end

keys['ctrl+t'] = function()
  local ok, cwd = pcall(function()
			  local filename = _G.buffer.filename
			  return filename:match("^(.-)[^/\\]*$")
			end)
  if ok then
    _G.os.spawn('wezterm start --cwd ' .. cwd)
  else
    _G.os.spawn('wezterm start --cwd .')
  end
end

-- local ok, lsp = pcall(require, 'lsp')
-- if ok then
-- 	keys['ctrl+f12'] = lsp.goto_declaration
-- 	lsp.server_commands.rust = 'rust-analyzer'
-- end
