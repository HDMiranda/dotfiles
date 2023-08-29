--------------------
-- Language Setup --
--------------------
local lsp = require('lsp-zero').preset("recommended")
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local U = require('configs.lsp.utilities')

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = 'i'
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

---Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200
}

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
  U.formatting_callback(client, buf)
  U.mappings(buf)
end

-- Set LSP logging
-- vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)

---List of the LSP server that don't need special configuration
local servers = {
  'tsserver', -- Typescript
  'html',     -- HTML
  'cssls',    -- CSS
  'angularls' -- Angular
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach
  })
end

-- Vim
lspconfig.vimls.setup {
  diagnostic = {
    enable = true
  },
  indexes = {
    count = 3,
    gap = 100,
    projectRootPatterns = {
      'runtime',
      'nvim',
      '.git',
      'autoload',
      'plugin'
    },
    runtimepath = true
  },
  isNeovim = true,
  iskeyword = '@,48-57,_,192-255,-#',
  runtimepath = '',
  suggest = {
    fromRuntimepath = true,
    fromVimruntime = true
  },
  vimruntime = '',
  on_attach = on_attach
}

-- Lua
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- PHP
lspconfig.phpactor.setup {
  on_attach = on_attach,
  init_options = {
    ['language_server_phpstan.enabled'] = false,
    ['language_server_psalm.enabled'] = false
  }
}

lsp.setup()
