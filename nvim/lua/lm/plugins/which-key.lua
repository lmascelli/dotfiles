local function keymapping()
  local wk = require 'which-key'
  wk.register({
    ['<leader>'] = {
      e = { '<cmd>lua LM.toggle_explorer()<cr>', 'File explorer' },
      w = {
        name = '+Window',
        h = { '<c-w>h', 'Left' },
        l = { '<c-w>l', 'Right' },
        j = { '<c-w>j', 'Down' },
        k = { '<c-w>k', 'Up' },
        v = { '<cmd>vsplit<cr>', 'VSplit' },
        s = { '<cmd>split<cr>', 'HSplit' },
        o = { '<cmd>only!<cr>', 'Close others' },
        d = { '<cmd>q<cr>', 'Quit current window' },
      },
      b = {
        name = "+Buffer",
        d = { '<cmd>lua LM.buffer_delete()<cr>', 'Delete' },
        s = { '<cmd>:w<cr>', 'Save' },
        S = { ':w ', 'Save As' },
        a = { '<cmd>wa<cr>', 'Save All' },
        l = { '<cmd>buffers<cr>', 'List buffers' },
        f = { '<cmd>lua LM.indent_buffer()<cr>', 'Indent buffer' },
      },
      s = {
        name = "+Search",
        s = { '/', 'Search', silent = false },
        r = { ':%s/', 'Search', silent = false },
        h = { '<cmd>nohl<cr>', 'highlight off' },
      },
      v = {
        name = '+Script',
        c = { '<cmd>source %<cr>', 'Source current file' },
        r = { '<cmd>lua LM.reload_vimrc()<cr>', 'Reload configuration' },
        l = { '<cmd>lua LM.project_lua()<cr>', 'run project.lua' },
        p = { '<cmd>lua LM.project_ps1()<cr>', 'run project.ps1' },
        e = { '<cmd>lua LM.edit_conf()<cr>', 'Edit nvim configuration' },
      },
      q = {
        name = '+Quit',
        q = { '<cmd>qa!<cr>', 'Quit' },
      },
      a = {
        name = '+Apparence',
        d = { '<cmd>set background=dark<cr>', 'background dark' },
        l = { '<cmd>set background=light<cr>', 'background light' },
        ['+'] = { '<cmd>lua LM.increase_font_size()<cr>', 'background light' },
        ['-'] = { '<cmd>lua LM.decrease_font_size()<cr>', 'background light' },
      }
    }
  }, { silent = true })

end

return {
  setup = function(use)
    use 'folke/which-key.nvim'
  end,

  config = function()
    local wk = require 'which-key'
    wk.setup {
      window = {
        border = "double",
        margin = { 1, 1, 1, 1 },
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 5,
        align = "left",
      },
      show_help = true,
    }
    LM.which_key_enabled = true
    vim.opt.timeoutlen = 500
    keymapping()
  end
}
