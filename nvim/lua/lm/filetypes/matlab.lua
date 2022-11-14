local keymap = LM.keymap.set_keymap

if LM.env.matlab_exec then
  keymap("n", "<f1>", vim.fn['jobstart']({ LM.env.matlab_exec .. '-nodesktop' }))
end
