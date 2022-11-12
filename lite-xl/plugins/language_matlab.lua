-- mod-version:3 -- priority: 99

local syntax = require 'core.syntax'

syntax.add {
  name = "Matlab",
  files = { '%.c$' },
  comment = '%',
  block_comment = {'%{', '%}'},
  patterns = {
    { pattern = '%.*', type='comment'},
    { pattern = {'%{*', '%}'}, type='comment'},
  }
}
