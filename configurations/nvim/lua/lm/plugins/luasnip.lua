return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local paths = {}
    paths[#paths + 1] = LM.api.utils.join_paths(vim.fn.stdpath('data'), "lazy",
      "friendly-snippets")
    local user_snippets = LM.api.utils.join_paths(vim.fn.stdpath('config'), "snippets")
    if LM.api.utils.is_directory(user_snippets) then
      paths[#paths + 1] = user_snippets
    end
    local ls = require("luasnip")
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = paths,
    }
    require("luasnip.loaders.from_snipmate").lazy_load()

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end,
}
