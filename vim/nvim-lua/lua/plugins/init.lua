return {
  ----------------------
  -- Required plugins --
  ----------------------
  'nvim-lua/plenary.nvim',

  -----------------------------
  -- Themes and colorschemes --
  -----------------------------
  'PHSix/nvim-hybrid',
  'RRethy/nvim-base16',

  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  },

  --------
  -- UI --
  --------
  'rcarriga/nvim-notify',
  'nvim-telescope/telescope-ui-select.nvim',
  'lewis6991/gitsigns.nvim',
  'folke/which-key.nvim',

  --------------------------------
  -- LSP, completion and syntax --
  --------------------------------
  'williamboman/mason.nvim',           -- Optional
  'williamboman/mason-lspconfig.nvim', -- Optional

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig', -- Required

      -- Autocompletion
      'hrsh7th/nvim-cmp',     -- Required
      'hrsh7th/cmp-nvim-lsp', -- Required
      'L3MON4D3/LuaSnip',     -- Required
    },
    config = function()
      require('config.lsp.language-servers')
    end
  },

  ---------------------
  -- File management --
  ---------------------
  'kyazdani42/nvim-tree.lua',
  'tpope/vim-fugitive',

  ------------------
  -- Plugin Setup --
  ------------------
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        hijack_cursor = true,
        view = {
          adaptive_size = true,
          centralize_selection = false,
          width = 30,
          side = 'right',
          preserve_window_proportions = false,
          number = false,
          relativenumber = true,
          signcolumn = 'yes',
          float = {
            enable = true,
            open_win_config = {
              relative = 'editor',
              border = 'rounded',
              width = 30,
              row = 1,
              col = 1
            }
          }
        }
      })
    end,
  },

  --------------
  -- Editing --
  --------------
  { 'numToStr/Comment.nvim', event = 'BufRead' },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true, -- show icons in the signs column
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
    }
  },
  {
    'tpope/vim-surround',
    event = 'BufRead',
    dependencies = {
      {
        'tpope/vim-repeat',
        event = 'BufRead'
      }
    }
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
    end
  },

  'mbbill/undotree',
}
