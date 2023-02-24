-------------------   GLOBAL FUNCTIONS   ----------------------


-- reload vimrc
vim.g.reload_vimrc = function()
  vim.cmd ':so $MYVIMRC'
end


-- exec PROJECT.PS1 script
vim.g.project_ps1 = function()
  if (vim.fn.findfile('project.ps1') == 'project.ps1') then
    local action = vim.fn.input('arguments: ')
    local cmd = 'pwsh -Command ./project.ps1 ' .. action
    vim.cmd (':terminal ' .. cmd)
 else
    print 'project.ps1 script not found'
  end
end

-- exec PROJECT.PS1 script
vim.g.project_lua = function()
  if (vim.fn.findfile('project.lua') == 'project.lua') then
    local action = vim.fn.input('arguments: ')
    print ' '
    vim.cmd ':source project.lua'
  else
    print 'project.ps1 script not found'
  end
end

-- font management
if (vim.g.font_size == nil) then
  vim.g.font_size = 10
end

vim.g.update_font = function()
  if vim.g.font_name ~= nil then
    vim.o.guifont = vim.g.font_name .. ':h' .. tostring(vim.g.font_size)
  else
    print (vim.g.font_name)
    print 'vim.g.font_name not provided'
  end
end

vim.g.increase_font = function()
  vim.g.font_size = vim.g.font_size + 1
  vim.g.update_font()
end

vim.g.decrease_font = function()
  vim.g.font_size = vim.g.font_size - 1
  vim.g.update_font()
end


return {}
