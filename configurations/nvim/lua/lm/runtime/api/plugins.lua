LM.api.plugins = {
  add_plugin = function (file_name)
    local is_present = false
    for _, p in ipairs(LM.plugins.files_list) do
      if p == file_name then
        is_present = true
        break
      end
    end
    if is_present == false then
      table.insert(LM.plugins.files_list, file_name)
    end
  end
}
