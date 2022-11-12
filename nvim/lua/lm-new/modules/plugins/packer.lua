local M = {}

M.priority = 'plugin_manager'
M.use = nil

M.setup = function()
  -- check if packer is installed
  local packer_path = LM.dirs.data .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    }
    print "Cloning packer manager... \nClose and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
    return false
  else
    return true
  end
end

M.config = function()
  local status_ok, packer = pcall(require, "packer")
  if status_ok then
    packer.startup({
      function (use)
        use "wbthomason/packer.nvim"
        use "nvim-lua/plenary.nvim"
        M.use = use
      end})
    return true
  else
    vim.notify 'ERROR: problems loading packer'
    return nil
  end
end

return M
