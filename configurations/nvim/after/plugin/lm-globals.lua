local utils = require 'core.utils'
vim.api.nvim_create_user_command("LMOpenConfig", utils.edit_custom_config, {desc = "Open custom.lua configuration file"})
vim.api.nvim_create_user_command("LMOpenConfigDir", function() utils.edit_conf_dir(true) end, {desc = "Open the nvim configuration directory"})
vim.api.nvim_create_user_command("LMBdelete", function() utils.delete_buffer(true) end, {desc = "Delete the current buffer"})
vim.cmd 'cnoremap bd LMBdelete'
vim.api.nvim_create_user_command("LMTerm", utils.spawn_terminal, {desc = "Spawn an external terminal"})
