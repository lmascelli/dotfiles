local M = {}

M.name = "tagbar"

M.url = "preservim/tagbar"

-- M.branch = ""

-- M.requires = { { url = "" }, }

M.lazy = true

M.cmd = "TagbarToggle"

-- M.event = { "", }

M.init = function()
  -- often used to set keymaps
  LM.keymaps.add_map("n", "<leader>bt", "<cmd>TagbarToggle<cr>", nil, nil,
    "toggle tagbar")
end

-- M.config = function()
--
-- end

return M
