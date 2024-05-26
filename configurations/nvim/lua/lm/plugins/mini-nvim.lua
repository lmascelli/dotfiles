return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local mini_extra = require('mini.extra')
    mini_extra.setup({})
    local mini_completion = require('mini.completion')

    -- disable snippetSupport for lsp because expanding snippets is not supported
    LM.lsp.capabilities.textDocument.completion.completionItem.snippetSupport = false

    mini_completion.setup(
      {
        -- Delay (debounce type, in ms) between certain Neovim event and action.
        -- This can be used to (virtually) disable certain automatic actions by
        -- setting very high delay time (like 10^7).
        delay = { completion = 100, info = 100, signature = 50 },

        -- Configuration for action windows:
        -- - `height` and `width` are maximum dimensions.
        -- - `border` defines border (as in `nvim_open_win()`).
        window = {
          info = { height = 25, width = 80, border = 'rounded' },
          signature = { height = 25, width = 80, border = 'rounded' },
        },

        -- Way of how module does LSP completion
        lsp_completion = {
          -- `source_func` should be one of 'completefunc' or 'omnifunc'.
          source_func = 'completefunc',

          -- `auto_setup` should be boolean indicating if LSP completion is set up
          -- on every `BufEnter` event.
          auto_setup = true,

          -- `process_items` should be a function which takes LSP
          -- 'textDocument/completion' response items and word to complete. Its
          -- output should be a table of the same nature as input items. The most
          -- common use-cases are custom filtering and sorting. You can use
          -- default `process_items` as `MiniCompletion.default_process_items()`.
          -- process_items = function() end
        },

        -- Fallback action. It will always be run in Insert mode. To use Neovim's
        -- built-in completion (see `:h ins-completion`), supply its mapping as
        -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
        --- fallback_action = --<function: like `<C-n>` completion>,

        -- Module mappings. Use `''` (empty string) to disable one. Some of them
        -- might conflict with system mappings.
        mappings = {
          force_twostep = nil, --'<C-Space>',  -- Force two-step completion
          force_fallback = nil, --'<A-Space>', -- Force fallback completion
        },

        -- Whether to set Vim's settings for better experience (modifies
        -- `shortmess` and `completeopt`)
        set_vim_settings = true,
      }
    )

    local mini_files = require('mini.files')
    mini_files.setup({
      -- No need to copy this inside `setup()`. Will be used automatically.
      {
        -- Customization of shown content
        content = {
          -- Predicate for which file system entries to show
          filter = nil,
          -- What prefix to show to the left of file system entry
          prefix = nil,
          -- In which order to show file system entries
          sort = nil,
        },

        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
          close       = 'q',
          go_in       = 'l',
          go_in_plus  = 'L',
          go_out      = 'h',
          go_out_plus = 'H',
          reset       = '<BS>',
          reveal_cwd  = '@',
          show_help   = 'g?',
          synchronize = '=',
          trim_left   = '<',
          trim_right  = '>',
        },

        -- General options
        options = {
          -- Whether to delete permanently or move into module-specific trash
          permanent_delete = true,
          -- Whether to use for editing directories
          use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
          -- Maximum number of windows to show side by side
          max_number = math.huge,
          -- Whether to show preview of file/directory under cursor
          preview = false,
          -- Width of focused window
          width_focus = 50,
          -- Width of non-focused window
          width_nofocus = 15,
          -- Width of preview window
          width_preview = 25,
        },
      }
    })
    LM.api.toggle_explorer = function()
      MiniFiles.open()
    end

    local mini_pick = require('mini.pick')
    mini_pick.setup({
      {
        -- Delays (in ms; should be at least 1)
        delay = {
          -- Delay between forcing asynchronous behavior
          async = 10,

          -- Delay between computation start and visual feedback about it
          busy = 50,
        },

        -- Keys for performing actions. See `:h MiniPick-actions`.
        mappings = {
          caret_left        = '<Left>',
          caret_right       = '<Right>',

          choose            = '<CR>',
          choose_in_split   = '<C-s>',
          choose_in_tabpage = '<C-t>',
          choose_in_vsplit  = '<C-v>',
          choose_marked     = '<M-CR>',

          delete_char       = '<BS>',
          delete_char_right = '<Del>',
          delete_left       = '<C-u>',
          delete_word       = '<C-w>',

          mark              = '<C-x>',
          mark_all          = '<C-a>',

          move_down         = '<C-n>',
          move_start        = '<C-g>',
          move_up           = '<C-p>',

          paste             = '<C-r>',

          refine            = '<C-Space>',
          refine_marked     = '<M-Space>',

          scroll_down       = '<C-f>',
          scroll_left       = '<C-h>',
          scroll_right      = '<C-l>',
          scroll_up         = '<C-b>',

          stop              = '<Esc>',

          toggle_info       = '<S-Tab>',
          toggle_preview    = '<Tab>',
        },

        -- General options
        options = {
          -- Whether to show content from bottom to top
          content_from_bottom = false,

          -- Whether to cache matches (more speed and memory on repeated prompts)
          use_cache = true,
        },

        -- Source definition. See `:h MiniPick-source`.
        source = {
          items         = nil,
          name          = nil,
          cwd           = nil,

          match         = nil,
          show          = nil,
          preview       = nil,

          choose        = nil,
          choose_marked = nil,
        },

        -- Window related options
        window = {
          -- Float window config (table or callable returning it)
          config = nil,

          -- String to use as cursor in prompt
          prompt_cursor = '▏',

          -- String to use as prefix in prompt
          prompt_prefix = '> ',
        },
      }
    })

    vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', { desc = 'Find file' })

    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = 'n', keys = '<Leader>a', desc = '+Appearence' },
        { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
        { mode = 'n', keys = '<Leader>c', desc = '+Configuration' },
        { mode = 'n', keys = '<Leader>d', desc = '+Diagnostics' },
        { mode = 'n', keys = '<Leader>f', desc = '+Find' },
        { mode = 'n', keys = '<Leader>o', desc = '+Org' },
        { mode = 'n', keys = '<Leader>p', desc = '+Project' },
        { mode = 'n', keys = '<Leader>q', desc = '+Quit' },
        { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
        { mode = 'n', keys = '<Leader>w', desc = '+Windows' },
      },
    })

    local mini_surround = require('mini.surround')

    mini_surround.setup(
    -- No need to copy this inside `setup()`. Will be used automatically.
      {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'sa',            -- Add surrounding in Normal and Visual modes
          delete = 'sd',         -- Delete surrounding
          find = 'sf',           -- Find surrounding (to the right)
          find_left = 'sF',      -- Find surrounding (to the left)
          highlight = 'sh',      -- Highlight surrounding
          replace = 'sr',        -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`

          suffix_last = 'l',     -- Suffix to search with "prev" method
          suffix_next = 'n',     -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,

        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
        -- see `:h MiniSurround.config`.
        search_method = 'cover',

        -- Whether to disable showing non-error feedback
        silent = false,
      }
    )
  end
}
