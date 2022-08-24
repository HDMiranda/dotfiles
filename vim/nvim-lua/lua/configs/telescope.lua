local actions = require('telescope.actions')
local finders = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    prompt_prefix = ' ❯ ',
    initial_mode = 'insert',
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top'
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case' -- "smart_case" | "ignore_case" | "respect_case"
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
})

require('telescope').load_extension('ui-select')

local Telescope = setmetatable({}, {
  __index = function(_, k)
    if vim.bo.filetype == 'NvimTree' then
      vim.cmd.wincmd('l')
    end
    return finders[k]
  end
})

-- Ctrl-p = fuzzy finder
vim.keymap.set('n', '<C-P>', function()
  --   if next(vim.fs.find({ '.git' })) then
  -- Telescope.git_files({ show_untracked = true })
  --    else
  Telescope.find_files({
    hidden = true
  })
  --    end
end)

-- Get :help at the speed of light
vim.keymap.set('n', '<leader>h', Telescope.help_tags)

-- Fuzzy find active buffers
vim.keymap.set('n', '<leader>b', Telescope.buffers)

-- Search for string
vim.keymap.set('n', '<leader>f', Telescope.live_grep)

-- Fuzzy find changed files in git
vim.keymap.set('n', '<leader>g', Telescope.git_status)
