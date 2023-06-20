local options = {}

-------------------------------------------------------------------------------
-- load options function
-------------------------------------------------------------------------------

options.load_options = function(opts, settings)
  for k, v in pairs(opts) do
    LM.g.opts[k] = v
  end

  for k, v in pairs(settings) do
    LM.g.settings[k] = v
  end
end

-------------------------------------------------------------------------------
-- apply options function
-------------------------------------------------------------------------------
-- when adding a setting remember to add the related export code in
-- utils/export.lua !!!


options.apply_options = function(opts, settings)
  for k, v in pairs(opts) do
    vim.opt[k] = v
  end

  if settings.colorcolumn then
    vim.o.colorcolumn = tostring(settings.colorcolumn_number)
  else
    vim.o.colorcolumn = tostring(0)
  end

  if not settings.terminal_line_number then
    -- no number in terminal mode
    vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"
  end

  if not settings.EOF_indicator then
    -- no EOF indicator ~
    vim.cmd ":set fillchars+=eob:\\ "
  end

  if settings.italic_comments then
    -- italic font for comments
    vim.cmd "highlight Comment cterm=italic gui=italic"
  end

  if settings.global_statusline then
    vim.opt.laststatus = 3
  end

  if vim.fn.has('win32') and settings.no_fsync_on_win32 then
    vim.o.fsync = false
  end
end

return options
