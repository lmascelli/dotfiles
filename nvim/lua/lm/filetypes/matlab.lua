local keymap = LM.keymap.set_keymap

keymap("n", "<f1>", vim.fn['jobstart']({LM.config.matlab_exec .. '-nodesktop'}))
