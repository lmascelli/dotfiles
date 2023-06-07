local M = {}

M.name = "org"

M.url = "nvim-orgmode/orgmode"

-- M.branch = ""

M.requires = { { url = "nvim-treesitter/nvim-treesitter" }, }

-- M.lazy = true

-- M.cmd = ""

M.ft = {'org'}

-- M.event = { "", }

-- M.init = function ()
--   -- often used to set keymaps
-- end

M.config = function()
  local ok, orgmode = pcall(require, 'orgmode')
  if ok then
    orgmode.setup_ts_grammar()
    orgmode.setup{}
  else
    print 'fail setup orgmode'
  end
end

return M
