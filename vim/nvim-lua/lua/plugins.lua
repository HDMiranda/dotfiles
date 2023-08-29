-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', {
    clear = true
  }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile'
})

return require('packer').startup({
  function(use)
    ---------------------
    -- Package manager --
    ---------------------
    use('wbthomason/packer.nvim')

    ----------------------
    -- Required plugins --
    ----------------------

    use('nvim-lua/plenary.nvim')

    -----------------------------
    -- Themes and colorschemes --
    -----------------------------
    use('PHSix/nvim-hybrid')
    use('RRethy/nvim-base16')

    use({
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup()
      end
    })

    use({
      'nvim-lualine/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }
    })

    --------
    -- UI --
    --------
    use {
      'goolord/alpha-nvim',
      requires = {
        'kyazdani42/nvim-web-devicons'
      },
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    }
    use {
      'nvim-telescope/telescope-ui-select.nvim'
    }
    use {
      'lewis6991/gitsigns.nvim'
    }
    use {
      'folke/which-key.nvim',
    }

    --------------------------------
    -- LSP, completion and syntax --
    --------------------------------
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
      }
    }

    ----------
    -- Test --
    ----------
    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-lua/plenary.nvim',
        'vim-test/vim-test',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'haydenmeade/neotest-jest',
        'nvim-neotest/neotest-vim-test'
      }
    }

    ---------------------
    -- File management --
    ---------------------
    use('kyazdani42/nvim-tree.lua')
    use('Shatur/neovim-session-manager')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')

    ------------------
    -- Fuzzy Finder --
    ------------------
    use({
      'nvim-telescope/telescope.nvim',
      tag = '0.1.2',
      requires = {
        {
          'nvim-lua/plenary.nvim'
        }
      }
    })

    -----------------------------------
    -- Treesitter: Better Highlights --
    -----------------------------------
    use({
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
      },
      {
        'nvim-treesitter/playground',
        after = 'nvim-treesitter'
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
      },
      {
        'nvim-treesitter/nvim-treesitter-refactor',
        after = 'nvim-treesitter'
      },
      {
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter'
      },
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        after = 'nvim-treesitter'
      }, {
      'sharkdp/fd',
      after = 'nvim-treesitter'
    }
    })

    ------------------
    -- Plugin Setup --
    ------------------
    require('nvim-tree').setup({
      view = {
        adaptive_size = true,
        centralize_selection = false,
        width = 30,
        hide_root_folder = false,
        side = 'left',
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

    --------------
    -- Editing --
    --------------
    use({
      'numToStr/Comment.nvim',
      event = 'BufRead',
      config = function()
        require('configs.comment')
      end
    })

    use({
      'tpope/vim-surround',
      event = 'BufRead',
      requires = {
        {
          'tpope/vim-repeat',
          event = 'BufRead'
        }
      }
    })

    use('mbbill/undotree')

    ------------------
    -- Initializers --
    ------------------
    require('mason').setup()
    require('configs.alpha')
    require('configs.treesitter')
    require('configs.lualine')
    require('configs.telescope')
    require('configs.gitsigns')
    require('configs.session-manager')
    require('configs.lsp.nvim-cmp')
    require('configs.lsp.language-servers')
    require('configs.test')
    require('configs.which-key')
    require('configs.harpoon')
    require('configs.undotree')
  end
})
