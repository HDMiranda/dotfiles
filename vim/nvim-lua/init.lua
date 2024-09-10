----------
-- Lazy --
----------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Map <leader> to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.o.termguicolors = true

require('lazy').setup('plugins')

--------------
-- Settings --
--------------

require('settings')


--- Colorscheme

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



--------------
-- Mappings --
--------------

require('mappings')
