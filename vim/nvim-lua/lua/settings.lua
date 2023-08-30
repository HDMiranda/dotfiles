local g = vim.g
local o = vim.o

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

require('catppuccin').setup({
  flavour = 'macchiato', -- latte, frappe, macchiato, mocha
  background = {         -- :h background
    light = 'latte',
    dark = 'mocha',
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,              -- dims the background color of inactive window
    shade = 'dark',
    percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,              -- Force no italic
  no_bold = false,                -- Force no bold
  no_underline = false,           -- Force no underline
  styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { 'italic' },      -- Change the style of comments
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- Colorscheme
local function colorize(color)
  color = color or "base16-gruvbox-dark-pale"
  vim.cmd.colorscheme(color)
  -- vim.cmd([[colorscheme base16-everforest]])
  -- vim.cmd([[colorscheme base16-material-ocean]])
  -- vim.cmd([[colorscheme base16-material-palenight]])
  -- vim.cmd([[colorscheme base16-tomorrow-night]])
  -- vim.cmd([[colorscheme base16-eighties]])
  -- vim.cmd([[colorscheme base16-base16-gruvbox-dark-pale]])

  -- Set transparent background
  vim.cmd('highlight Normal guibg=none')
  vim.cmd('highlight NonText guibg=none')
  vim.cmd('highlight Normal ctermbg=none')
  vim.cmd('highlight NonText ctermbg=none')
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colorize('catppuccin')

o.termguicolors = true
o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 6
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = false
o.textwidth = 100
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = true
o.writebackup = true
o.undofile = true
o.swapfile = false
o.backupdir = '~/tmp/'
-- o.directory = '/tmp/'
o.undodir = '~/tmp/'

-- Remember 500 items in commandline history
o.history = 500

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to comma
g.mapleader = ','
g.maplocalleader = ','
