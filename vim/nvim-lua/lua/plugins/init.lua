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
