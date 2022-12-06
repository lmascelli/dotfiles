return {
  setup = function(use)
    use {
      LM.dirs.config .. "/lua/lm/plugins/src/black.vim",
      opt = true,
      ft = { "python" }
    }
  end,
  config = function ()
  end
}
