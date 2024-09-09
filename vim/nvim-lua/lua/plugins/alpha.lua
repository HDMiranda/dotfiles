return {
  'goolord/alpha-nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('alpha').setup(
      require('alpha.themes.dashboard').config
    )
  end
}

-- local alpha = require 'alpha'
-- local dashboard = require 'alpha.themes.dashboard'
-- local logo = require 'configs.logos'
--
-- dashboard.section.header.val = logo.hd_doom
--
-- dashboard.section.buttons.val = {
--   dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
--   dashboard.button('f', '  Find file', ':cd $HOME | Telescope find_files<CR>'),
--   dashboard.button('r', '  Recent', ':Telescope oldfiles<CR>'),
--   dashboard.button('leader sl', '  Select session', ':SessionManager load_session<CR>'),
--   dashboard.button('leader s', '  Open last session', ':SessionManager load_last_session<CR>'),
--   dashboard.button('q', '  Quit NVIM', ':qa<CR>')
-- }
--
-- local handle = io.popen('fortune')
-- local fortune = handle:read('*a')
--
-- handle:close()
--
-- dashboard.section.footer.val = fortune
-- dashboard.config.opts.noautocmd = true
--
-- vim.cmd [[autocmd User AlphaReady echo 'ready']]
--
-- alpha.setup(dashboard.config)
