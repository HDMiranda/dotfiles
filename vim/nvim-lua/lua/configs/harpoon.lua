local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>hh', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>hg', function() ui.nav_file(2) end)
