local M  = {}

M.name   = 'treesitter'
M.url    = 'nvim-treesitter/nvim-treesitter'
M.lazy   = true
M.event  = { "BufNewFile", "FileReadPost" }
M.ft     = { "lua", "python", "c", "cpp", "markdown" }
M.config = function()
  local found, treesitter = pcall(require, 'nvim-treesitter.configs')
  if found then
    treesitter.setup {
      ensure_installed = { "cpp", "lua", "vim", "help", "python" },
      auto_install = true,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = false
      }
    }
    vim.cmd [[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        ]]
  end
end

return M
