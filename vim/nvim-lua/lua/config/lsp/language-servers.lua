--------------------
-- Language Setup --
--------------------
local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local U = require('config.lsp.utilities')

local lsp_attach = function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- lsp.default_keymaps({ buffer = bufnr })
  U.mappings(bufnr)
end

---Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200
}


lsp_zero.extend_lspconfig({
  capabilities = capabilities,
  flags = flags,
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = true,
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = 'i'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['cssls'] = { 'css', 'scss' },
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['eslint'] = { 'javascript', 'typescript' },
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'angularls',
    'bashls',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'eslint',
    'html',
    'lua_ls',
    'phpactor',
    'rust_analyzer',
    'sqlls',
    'tailwindcss',
    'ts_ls',
    'yamlls',
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({})
    end,

    angularls = function()
      lspconfig.angularls.setup {
        root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
        filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' }
      }
    end,

    vimls = function()
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
        on_attach = lsp_attach
      }
    end,

    lua_ls = function()
      lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
    end,

    phpactor = function()
      lspconfig.phpactor.setup {
        on_attach = lsp_attach,
        init_options = {
          ['language_server_phpstan.enabled'] = false,
          ['language_server_psalm.enabled'] = false
        }
      }
    end,
  },
})


require('config.lsp.nvim-cmp')
