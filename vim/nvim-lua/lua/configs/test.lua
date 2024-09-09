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
