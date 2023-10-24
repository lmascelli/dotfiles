return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local paths = {}
    paths[#paths + 1] = LM.api.utils.join_paths(vim.fn.stdpath('data'), "site", "pack", "lazy", "opt",
      "friendly-snippets")
    local user_snippets = LM.api.utils.join_paths(vim.fn.stdpath('config'), "snippets")
    if LM.api.utils.is_directory(user_snippets) then
      paths[#paths + 1] = user_snippets
    end
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = paths,
    }
    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
