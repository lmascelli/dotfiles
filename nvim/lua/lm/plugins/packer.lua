local packer = {}

packer.packer = function()
  local packer_install_path = LM.dirs.data .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_install_path,
    }
    print "Cloning packer manager... \nClose and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
  end

  local status_ok, packer_ = pcall(require, "packer")
  if status_ok then
    packer_.startup(
      {
        function(use)
          use "wbthomason/packer.nvim"
          use "nvim-lua/plenary.nvim"
        end,
        config = {
        }
      }
    )

    if PACKER_BOOTSTRAP then
      require("packer").sync()
      vim.notify('If new packages have been installed restart nvim')
    end

    return packer_
  else
    return nil
  end
end

packer.install_plugin = function(plugin)
  local packer_ = LM.plugins.manager
  if not packer_ then
    packer.packer()
  end
  local status_ok, p = pcall(require, 'lm.plugins.' .. plugin)
  if status_ok then p.setup(packer_.use) end
end

packer.config_plugin = function(plugin)
  local status_ok, p = pcall(require, 'lm.plugins.' .. plugin)
  if status_ok then
    status_ok, _ = pcall(p.config)
  else
    vim.notify('error loading ' .. v .. ' plugin. try run :PackerSync')
  end
end

return packer
