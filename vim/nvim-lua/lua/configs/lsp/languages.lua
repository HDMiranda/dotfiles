--------------------
-- Language Setup --
--------------------
local lsp = require('lspconfig')
local U = require('configs.lsp.utilities')

---Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
  -- U.disable_formatting(client)
  U.formatting_callback(client, buf)
  U.mappings(buf)
end

-- Set LSP logging
-- vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)

-- Configuring native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = 'always'
  },
  float = {
    source = 'always'
  }
})

---List of the LSP server that don't need special configuration
local servers = {
  -- 'css-lsp',
  -- 'cssmodules-language-server',
  -- 'tailwindcss-language-server',
  'tsserver', -- Typescript
  'html', -- HTML
  'cssls', -- CSS
  'angularls' -- Angular
  -- 'bash-language-server', --Bash
  -- 'chrome-debug-adapter', -- Chrome Debugger
  -- 'clang-format', -- C/C++ format
  -- 'clangd', -- C/C++ DAP
  -- 'deno', -- Deno
  -- 'dockerfile-language-server',
  -- 'eslint-lsp',
  -- 'eslint_d',
  -- 'json-lsp',
  -- 'lua-language-server',
  -- 'markdownlint',
  -- 'marksman',
  -- 'prettier',
  -- 'remark-language-server',
  -- 'sql-formatter',
  -- 'sqlfluff',
  -- 'sqlls',
  -- 'svelte-language-server',
  -- 'typescript-language-server',
  -- 'vim-language-server',
  -- 'vue-language-server',
  -- 'yaml-language-server',
  -- 'yamllint',
}

for _, server in ipairs(servers) do
  lsp[server].setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach
  })
end

-- Vim
require'lspconfig'.vimls.setup {
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
  vimruntime = ''
}

-- Lua
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim'
        }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true)
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      }
    }
  }
}

-- PHP
require'lspconfig'.phpactor.setup {
  on_attach = on_attach,
  init_options = {
    ['language_server_phpstan.enabled'] = false,
    ['language_server_psalm.enabled'] = false
  }
}
