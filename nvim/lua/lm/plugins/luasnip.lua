return {
  setup = function(use)
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'rafamadriz/friendly-snippets'
  end,
  config = function()
    local luasnip = require 'luasnip'
    luasnip.loaders.from_vscode.lazy_load()
  end
}
