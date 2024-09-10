----------
-- Test --
----------

return {
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
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-vim-test')({
            ignore_file_types = {
              'vim',
              'lua'
            },
            allow_file_types = {
              'ts'
              --   'haskell',
              --   'elixir'
            }
          })
        }
      })
    end
  },

  {
    'vim-test/vim-test',
    dependencies = { 'preservim/vimux' },
    config = function()
      vim.cmd("let test#strategy = 'vimux'")
    end
  },
}
