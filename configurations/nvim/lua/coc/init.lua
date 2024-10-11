--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 				  OPTIONS 				      --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = 'yes'

vim.opt.clipboard = "unnamedplus" -- system clipboard by default
vim.opt.cmdheight = 1             -- height of the commandline
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.cmd 'set omnifunc=ccomplete#Complete'
vim.opt.conceallevel = 0
vim.opt.cursorline = true                                           -- highlight the current line
vim.opt.exrc = true                                                 -- automatically load .nvim.lua in root folder
vim.opt.packpath = vim.opt.packpath + (vim.fn.getcwd() .. '/.nvim') -- add the .nvim local folder to manual plugins paths
vim.opt.foldmethod = "expr"                                         -- use treesitter based folding, "manual" otherwise
vim.opt.foldexpr =
""                                                                  -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.hidden = true                                               -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true                                             -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                                           -- ignore case in search patterns
vim.opt.matchpairs:append("<:>")
vim.opt.mouse = 'a'                                                 -- allow the mouse to be used in neovim
vim.opt.pumheight = 10
vim.opt.showmatch = true
vim.opt.showmode = false -- hide current mode in statusbar
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.foldlevelstart = 99
vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500     -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true         -- modify the window title
vim.opt.titlestring = '%t'   -- set the window title to the buffer name
vim.opt.undofile = true      -- save undos
vim.opt.updatetime = 100     -- for faster completion
vim.opt.writebackup = false  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.shiftwidth = 2       -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2          -- insert 2 spaces for a tab

-- junk files
vim.opt.backup = false   -- no backup files
vim.opt.swapfile = false -- no swapfiles

-- line number
vim.opt.number = true                                           -- show line numbers
vim.opt.relativenumber = true                                   -- show relative line numbers
vim.opt.numberwidth = 4                                         -- set number column width
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber" -- no line number in terminal mode

-- colorcolumn
vim.opt.colorcolumn = '0' -- column to highlight (0 to disable)

-- EOF indicator
vim.cmd ":set fillchars+=eob:\\ "

vim.opt.signcolumn = "auto"     -- show the sign column only if needed
vim.opt.wrap = false            -- display lines as one long line
vim.opt.scrolloff = 8           -- minimal number of screen lines to keep above and below the cursor.
-- vim.opt.sidescrolloff = 8       -- minimal number of screen lines to keep left and right of the cursor.
vim.opt.virtualedit = "onemore" -- let the cursor go one char after the end of the line
vim.opt.laststatus = 3          -- only a statusline for all windows

-- file encoding
pcall(function()
  vim.opt.fileencoding = 'utf-8'
end)

-- used for find files in current path with :find
vim.cmd 'set path=**'
vim.cmd 'set wildignore+=*/.git/*'

-- Windows performace option
vim.o.fsync = false

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 				GLOBAL KEYMAPS   		              --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- QUIT
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })

--  <C-g> as Escape
vim.keymap.set("n", "<C-g>", "<Escape>", {})

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<tab>", "==", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>'", ":make ", { desc = "Shell command" })
vim.keymap.set("n", "<C-'>", ":make ", { desc = "Shell command" })

--  WINDOWS
vim.keymap.set('n', '<leader>wc', '<cmd>q<cr>', { desc = "Close" })
vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = "Close others" })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = "Split vertical" })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = "Split horizontal" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go right" })
vim.keymap.set("n", "<A-Left>", "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<A-Down>", "<C-w>j", { desc = "Go down" })
vim.keymap.set("n", "<A-Up>", "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<A-Right>", "<C-w>l", { desc = "Go right" })
vim.keymap.set('n', '<m-ScrollWheelUp>', 'zhzh', { desc = "" })
vim.keymap.set('n', '<m-ScrollWheelDown>', 'zlzl', { desc = "" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "" })

-- TABS
vim.keymap.set("n", "<leader>tn", "<cmd>:tabnew<cr>", { desc = "New" })
vim.keymap.set("n", "<leader>td", "<cmd>:tabclose<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader><tab>", "<cmd>:tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<c-tab>", "<cmd>:tabnext<cr>", { desc = "Next tab" })

-- BUFFERS
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })

-- SEARCHING
vim.keymap.set('n', '<leader>fs', '/', { desc = 'Search' })
vim.keymap.set('n', '<leader>fr', ':%s/', { desc = 'replace' })
vim.keymap.set('n', '<leader>fh', '<cmd>nohl<cr>', { desc = 'highlight off' })

-- CONFIG
vim.keymap.set('n', '<leader>cf', '<cmd>CocConfig<cr>', { desc = 'CocConfig'})
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd(':e' .. vim.fn.stdpath("config") .. '/lua/coc/init.lua')
end, {desc = 'open config'})

-- ------------------------------------- INSERT ----------------------------------

--  <C-g> as Escape
vim.keymap.set("i", "<C-g>", "<Escape>", {})

vim.keymap.set("i", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("i", "<C-'>", "<C-k>'!", {})
vim.keymap.set("i", "<s-cr>", "<c-o>O", {})
vim.keymap.set("i", "<c-cr>", "<c-o>o", {})
-- File saving
-- vim.keymap.set("i", "<C-s>", "<cmd>:w!<cr>", {})

vim.keymap.set("i", '<Left>', "")
vim.keymap.set("i", '<Right>', "")
vim.keymap.set("i", '<Up>', "")
vim.keymap.set("i", '<Down>', "")
vim.keymap.set("i", '<PageUp>', "")
vim.keymap.set("i", '<PageDown>', "")

-- ------------------------------------- VISUAL ----------------------------------

--  <C-g> as Escape
vim.keymap.set("x", "<C-g>", "<Escape>", {})

-- Moving text
vim.keymap.set("x", "<A-j>", ":m .+1<CR>==", {})
vim.keymap.set("x", "<A-k>", ":m .-2<CR>==", {})
vim.keymap.set("x", "p", '"_dP', {})

-- Surrounding selected text
vim.cmd ':vnoremap s <Nop>'
vim.keymap.set("x", "s(", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s)", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s[", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "s]", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "sc", '"9xi{}<escape>h"9p', {})
vim.keymap.set("x", "s'", "\"9xi''<escape>h\"9p", {})
vim.keymap.set("x", 's"', '"9xi""<escape>h"9p', {})

-- Moving text
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", {})
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", {})

-- Indenting
vim.keymap.set("x", "<tab>", "=", {})


------------------------------   COMMAND LINE ---------------------------------

--  <C-g> as Escape
vim.keymap.set("c", "<C-g>", "<Escape>", {})

vim.keymap.set("c", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("c", "<C-'>", "<C-k>'!", {})


------------------------------------- TERMINAL --------------------------------

vim.keymap.set("t", "<Escape>", "<C-\\><C-n>", {})

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", {})

-- italian keyboard utility
vim.keymap.set('t', '<c-ì>', '~', {})
vim.keymap.set('t', '<c-\'>', '`', {})

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 				  PLUGINS                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "neoclide/coc.nvim",
      build = "npm ci",
      init = function()
        -- Auto install coc plugins
	      vim.g.coc_global_extensions = {"coc-lists", "coc-tag", "coc-pairs", "coc-json", "coc-explorer", }
      end,

      config = function()
        -- https://raw.githubusercontent.com/neoclide/coc.nvim/master/coc-example-config.lua

        -- Some servers have issues with backup files, see #649
        local keyset = vim.keymap.set
        -- Autocomplete
        function _G.check_back_space()
          local col = vim.fn.col('.') - 1
          return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        -- Use Tab for trigger completion with characters ahead and navigate
        -- NOTE: There's always a completion item selected by default, you may want to enable
        -- no select by setting `"suggest.noselect": true` in your configuration file
        -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
        -- other plugins before putting this into your config
        local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
        keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
        keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

        -- Make <CR> to accept selected completion item or notify coc.nvim to format
        -- <C-g>u breaks current undo, please make your own choice
        keyset('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

        -- Use <c-j> to trigger snippets
        keyset('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')
        -- Use <c-space> to trigger completion
        keyset('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

        -- Use `[g` and `]g` to navigate diagnostics
        -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
        keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
        keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

        -- GoTo code navigation
        keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
        keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
        keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
        keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

        -- Explorer
        keyset("n", "<leader>e", "<cmd>CocCommand explorer<cr>", { desc = "Explorer" })
        keyset('n', '<leader>ff', '<cmd>CocList files<cr>', { desc = 'Find file' })

        -- Appearence
        keyset("n", "<leader>ac", "<cmd>CocList colors<cr>", { desc = "Explorer" })


        -- Use K to show documentation in preview window
        function _G.show_docs()
          local cw = vim.fn.expand('<cword>')
          if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
          elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
          else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
          end
        end

        keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })


        -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
        vim.api.nvim_create_augroup('CocGroup', {})
        vim.api.nvim_create_autocmd('CursorHold', {
          group = 'CocGroup',
          command = "silent call CocActionAsync('highlight')",
          desc = 'Highlight symbol under cursor on CursorHold'
        })


        -- Symbol renaming
        keyset('n', 'grn', '<Plug>(coc-rename)', { silent = true })


        -- Formatting selected code
        keyset('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
        keyset('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })


        -- Setup formatexpr specified filetype(s)
        vim.api.nvim_create_autocmd('FileType', {
          group = 'CocGroup',
          pattern = 'typescript,json',
          command = "setl formatexpr=CocAction('formatSelected')",
          desc = 'Setup formatexpr specified filetype(s).'
        })

        -- Update signature help on jump placeholder
        vim.api.nvim_create_autocmd('User', {
          group = 'CocGroup',
          pattern = 'CocJumpPlaceholder',
          command = "call CocActionAsync('showSignatureHelp')",
          desc = 'Update signature help on jump placeholder'
        })

        -- Remap keys for apply refactor code actions.
        keyset('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', { silent = true })
        keyset('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })
        keyset('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

        -- Run the Code Lens actions on the current line
        keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)', opts)


        -- Map function and class text objects
        -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
        keyset('x', 'if', '<Plug>(coc-funcobj-i)', opts)
        keyset('o', 'if', '<Plug>(coc-funcobj-i)', opts)
        keyset('x', 'af', '<Plug>(coc-funcobj-a)', opts)
        keyset('o', 'af', '<Plug>(coc-funcobj-a)', opts)
        keyset('x', 'ic', '<Plug>(coc-classobj-i)', opts)
        keyset('o', 'ic', '<Plug>(coc-classobj-i)', opts)
        keyset('x', 'ac', '<Plug>(coc-classobj-a)', opts)
        keyset('o', 'ac', '<Plug>(coc-classobj-a)', opts)


        -- Remap <C-f> and <C-b> to scroll float windows/popups
        ---@diagnostic disable-next-line: redefined-local
        local opts = { silent = true, nowait = true, expr = true }
        keyset('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        keyset('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
        keyset('i', '<C-f>',
          'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
        keyset('i', '<C-b>',
          'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
        keyset('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        keyset('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


        -- Add `:Format` command to format current buffer
        vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})

        -- " Add `:Fold` command to fold current buffer
        vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })

        -- Add `:OR` command for organize imports of the current buffer
        vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

        -- Add (Neo)Vim's native statusline support
        -- NOTE: Please see `:h coc-status` for integrations with external plugins that
        -- provide custom statusline: lightline.vim, vim-airline
        vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

        -- Mappings for CoCList
        -- code actions and coc stuff
        ---@diagnostic disable-next-line: redefined-local
        local opts = { silent = true, nowait = true }
        -- Show commands
        keyset('n', '<c-P>', ':<C-u>CocList commands<cr>', opts)
        -- Show all diagnostics
        keyset('n', '<space>ca', ':<C-u>CocList diagnostics<cr>', opts)
        -- Find symbol of current document
        keyset('n', '<space>co', ':<C-u>CocList outline<cr>', opts)
        -- Search workspace symbols
        keyset('n', '<space>cs', ':<C-u>CocList -I symbols<cr>', opts)
      end,
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

