local lsp = require('lsp-zero').preset("recommended")
local lspconfig = require('lspconfig')
local U = require('configs.lsp.utilities')

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'phpactor',
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp.default_keymaps({ buffer = bufnr })
  U.mappings(bufnr)
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['eslint'] = { 'javascript', 'typescript' },
  }
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
