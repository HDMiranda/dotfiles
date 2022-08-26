local nls = require('null-ls')
local U = require('configs.lsp.utilities')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

-- Configuring null-ls
nls.setup({
  sources = {
    ----------------
    -- FORMATTING --
    ----------------
    fmt.trim_whitespace.with({
      filetypes = {
        'text',
        'zsh',
        'toml',
        'make',
        'conf',
        'tmux'
      }
    }),
    -- NOTE:
    -- 1. both needs to be enabled to so prettier can apply eslint fixes
    -- 2. prettierd should come first to prevent occassional race condition
    -- fmt.stylua.with({
    --     filetypes = { 'lua' },
    --     extra_args = {
    --         '--indent-width=2',
    --         '--indent-type="Spaces"',
    --         '--quote-style="AutoPreferSingle"',
    --     },
    -- }),
    fmt.lua_format.with({
      extra_args = {
        '--double-quote-to-single-quote',
        '--indent-width=2',
        '--tab-width=2',
        '--continuation-indent-width=2',
        '--column-table-limit=10',
        '--align-args',
        '--align-args',
        '--align-parameter',
        '--align-table-field',
        '--line-breaks-after-function-body=1',
        '--spaces-around-equals-in-field',
        '--no-keep-simple-control-block-one-line',
        '--no-keep-simple-function-one-line',
        '--chop-down-kv-table',
        '--no-keep-simple-control-block-one-line',
        '--no-keep-simple-function-one-line',
        '--no-chop-down-parameter',
        '--no-chop-down-table'
      }
    }),
    fmt.prettierd,
    fmt.eslint_d,
    fmt.phpcsfixer,
    -- fmt.prettier.with({
    --     extra_args = {
    --         '--tab-width=2',
    --         '--trailing-comma=es5',
    --         '--end-of-line=lf',
    --         '--arrow-parens=always',
    --     },
    -- }),
    fmt.rustfmt,
    fmt.gofmt,
    fmt.shfmt.with({
      extra_args = {
        '-i',
        4,
        '-ci',
        '-sr'
      }
    }),
    -----------------
    -- DIAGNOSTICS --
    -----------------
    dgn.eslint_d,
    dgn.shellcheck,
    dgn.phpactor,
    dgn.luacheck.with({
      extra_args = {
        '--globals',
        'vim',
        '--std',
        'luajit'
      }
    }),
    ------------------
    -- CODE ACTIONS --
    ------------------
    cda.eslint_d,
    cda.shellcheck
  },
  on_attach = function(client, bufnr)
    -- U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})
