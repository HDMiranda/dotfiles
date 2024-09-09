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

  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

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
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('configs.nvim-colorizer')
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig', -- Required

      -- Autocompletion
      'hrsh7th/nvim-cmp',     -- Required
      'hrsh7th/cmp-nvim-lsp', -- Required
      'L3MON4D3/LuaSnip',     -- Required
    }
  },

  ----------
  -- Test --
  ----------
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'vim-test/vim-test',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest',
      'nvim-neotest/neotest-vim-test'
    }
  },

  -- {
  --   'vim-test/vim-test',
  --   dependencies = {
  --     'preservim/vimux'
  --   },
  --   vim.cmd("let test#strategy = 'vimux'")
  -- },

  ---------------------
  -- File management --
  ---------------------
  'kyazdani42/nvim-tree.lua',
  'Shatur/neovim-session-manager',
  'theprimeagen/harpoon',
  'tpope/vim-fugitive',

  ------------------
  -- Fuzzy Finder --
  ------------------
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  -----------------------------------
  -- Treesitter: Better Highlights --
  -----------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
      'windwp/nvim-ts-autotag',
      'sharkdp/fd',
      'nvim-treesitter/nvim-treesitter-angular',
    },
  },

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
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function()
      require('configs.comment')
    end
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

  ------------------
  -- Initializers --
  ------------------
  -- require('configs.alpha'),
  -- require('configs.gitsigns'),
  -- require('configs.harpoon'),
  -- require('configs.lsp.language-servers'),
  -- require('configs.lsp.nvim-cmp'),
  -- require('configs.lualine'),
  -- require('configs.session-manager'),
  -- require('configs.telescope'),
  -- require('configs.test'),
  -- require('configs.treesitter'),
  -- require('configs.which-key'),
}
