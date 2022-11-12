local M = {}

M.load_module = function (module)
  local ok, m = pcall(require, 'lm.modules.' .. module)
  if ok then
    return m
  else
    return nil
  end
end

return M
