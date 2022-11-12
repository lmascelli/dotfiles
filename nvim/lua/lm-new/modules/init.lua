local M = {}

M.load_module = function(module_name)
  local mod_ok, module = pcall(require, module_name)
  if mod_ok then
    if module.setup() then
      if module.priority == 'plugin' then
        module.config()
      elseif module.pririty == 'post' then
        table.insert(LM.post_modules, module)
    end
  else
    vim.notify ''
    return nil
  end
end

return M
