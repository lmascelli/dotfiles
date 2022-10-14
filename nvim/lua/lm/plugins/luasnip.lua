return {
  setup = function(use)
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  end,
  config = function()
    require 'luasnip'
  end
}
