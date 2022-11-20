local keymap = LM.keymap.set_keymap
local custom = LM.custom.load_custom()

vim.cmd 'syntax on'

vim.opt_local.commentstring = '%%s'

if custom.matlab_exec then
  keymap("n", "<leader><f1>", "<cmd>lua vim.fn.jobstart({'" .. custom.matlab_exec .. "', '-nodesktop'})<cr>",
  nil, nil, "launch matlab -nodesktop")
end
