----------
-- Test --
----------

return {}

-- return {
--   {
--     'nvim-neotest/neotest',
--     dependencies = {
--       'nvim-neotest/nvim-nio',
--       'nvim-lua/plenary.nvim',
--       'vim-test/vim-test',
--       'nvim-treesitter/nvim-treesitter',
--       'antoinemadec/FixCursorHold.nvim',
--       'haydenmeade/neotest-jest',
--       -- 'nvim-neotest/neotest-vim-test',
--     },
--     config = function()
--       require('neotest').setup({
--         adapters = {
--           require('neotest-jest')({
--             jestCommand = "npm test --",
--             jestConfigFile = "custom.jest.config.ts",
--             env = { CI = true },
--             cwd = function(path)
--               return vim.fn.getcwd()
--             end,
--           }),
--           -- require('neotest-vim-test')({
--           --   -- ignore_file_types = {
--           --   --   'vim',
--           --   --   'lua'
--           --   -- },
--           --   allow_file_types = {
--           --     'typescript',
--           --     'javascript',
--           --     --   'haskell',
--           --     --   'elixir'
--           --   }
--           -- })
--         }
--       })
--     end
--   },
--
--   -- {
--   --   'vim-test/vim-test',
--   --   dependencies = { 'preservim/vimux' },
--   --   config = function()
--   --     vim.cmd("let test#strategy = 'vimux'")
--   --     vim.cmd("let test#javascript#ngtest#runner = 'nx'")
--   --     vim.cmd("let test#javascript#ngtest#executable = 'nx test'")
--   --   end
--   -- },
-- }
