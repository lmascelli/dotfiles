local M = {
  timer_work = 25, -- minutes
  timer_pause = 5, -- minutes
  current_repetition = 0,
  timer = vim.loop.new_timer(),
  run = function(self)
    local counter = 1
    self.timer:start(1000, 1000, function ()
      print(counter)
      counter = counter + 1
    end)
    print(self.timer_work)
  end
}

print(M:run())

return M
