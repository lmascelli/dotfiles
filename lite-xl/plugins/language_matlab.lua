-- priority: 0
-- mod-version:3 

local syntax = require 'core.syntax'

syntax.add {
  name = "matlab",
  files = { '.%.m$' },
  comment = '%%.',
  block_comment = {'%%{', '%%}'},
  patterns = {
    { pattern = {'%%{.*', '%%}'},   type='comment'},
    { pattern = '%%.*',             type='comment'},
    { pattern = {'"', '"', '\\'},   type='string' },
    { pattern = {"'", "'", '\\'},   type='string' },

  },
  symbols = {},
}
