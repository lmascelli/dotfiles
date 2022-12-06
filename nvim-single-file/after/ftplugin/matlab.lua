vim.cmd 'syntax on'

vim.opt_local.commentstring = '%%s'

local ok, wk = pcall(require, 'which-key')
if ok then
  wk.register {
    ["<leader><f1>"] = {
      "<cmd>lua vim.fn.jobstart({'" .. LM.matlab_exec .. "', '-nodesktop'})<cr>",
      "launch matlab -nodesktop" }
    }
else
  print 'AAA'
end
