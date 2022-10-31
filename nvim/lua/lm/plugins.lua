local fn = vim.fn

local packer_install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
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

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local settings = require 'lm_settings'
local plugin_list = {}
if settings.plugin_list ~= nil then
  plugin_list = settings.plugin_list
end

return packer.startup(
  {
    function(use)
      use "wbthomason/packer.nvim"
      use "nvim-lua/plenary.nvim"

      for _, v in pairs(plugin_list) do
        local status_ok, p = pcall(require, 'lm.plugins.' .. v)
        if status_ok then p.setup(use) end
      end

      if PACKER_BOOTSTRAP then
        require("packer").sync()
        vim.notify('If new packages have been installed restart nvim')
      end

      vim.g.lm['append']('config_plugins', function()
        for _, v in pairs(plugin_list) do
          local status_ok, p = pcall(require, 'lm.plugins.' .. v)
          if status_ok then
            status_ok, _ = pcall(p.config)
          else
            vim.notify('error loading ' .. v .. ' plugin. try run :PackerSync')
          end
        end
      end
      )
    end,
    config = {
    }
  }
)
