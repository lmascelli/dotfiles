local inspect = vim.inspect

local add_content = function(old_content, code)
  return old_content .. '\n' .. code
end

local add_file_to_content = function(old_content, path)
  local new_content = old_content
  local lines = vim.fn.readfile(path)
  for k, v in pairs(lines) do
    new_content = add_content(new_content, v)
  end
  return new_content
end

LM.export = {}

LM.export.single_file = function()
  -- This function should create a buffer with the source of a complete nvim
  -- configuration.
  local content = ''

  content = add_file_to_content(content, LM.dirs.config .. '/config.lua')

  -- exporting options
  for k, v in pairs(LM.g.opts) do
    content = add_content(content, 'vim.opt.' .. tostring(k) .. ' = '
    .. tostring(inspect(v)))
  end

  -- exporting settings
  if LM.g.settings.colorcolumn then
    content = add_content(content, 'vim.o.colorcolumn = '
    .. tostring(LM.g.settings.colorcolumn_number))
  else
    content = add_content(content, 'vim.o.colorcolumn = 0')
  end

  if not LM.g.settings.terminal_line_number then
    -- no number in terminal mode
    content = add_content(content,
    'vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"')
  end

  if not LM.g.settings.EOF_indicator then
    -- no EOF indicator ~
    content = add_content(content, 'vim.cmd ":set fillchars+=eob:\\ "')
  end

  if LM.g.settings.italic_comments then
    -- italic font for comments
    content = add_content(content,
    'vim.cmd "highlight Comment cterm=italic gui=italic"')
  end

  if LM.g.settings.global_statusline then
    content = add_content(content, 'vim.opt.laststatus = 3')
  end

  if vim.fn.has('win32') and LM.g.settings.no_fsync_on_win32 then
    content = add_content(content, 'vim.o.fsync = false')
  end

  -- here put in a new buffer
  print(content)
end
