local map = vim.keymap.set
local util = require('vim.lsp.util')

local U = {}

local fmt_group = vim.api.nvim_create_augroup('FORMATTING', {
  clear = true
})

---Common format-on-save for lsp servers that implements formatting
---@param client table
---@param buf integer
function U.fmt_on_save(client, buf)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = fmt_group,
      buffer = buf,
      callback = function()
        vim.lsp.buf.format({
          timeout_ms = 3000,
          buffer = buf
        })
      end
    })
  end
end

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require('cmp_nvim_lsp').default_capabilities(capabilities)
end

---Disable formatting for servers for neovim 0.7.2 | Handled by null-ls
---@param client table
---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
function U.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false  -- nvim 0.7
  client.server_capabilities.documentFormattingProvider = false  -- nvim 0.8
  client.server_capabilities.document_range_formatting = false  -- nvim 0.8
  client.server_capabilities.documentRangeFormattingProvider = true  -- nvim 0.8
end

-- Enable formatting for servers on neovim 0.7.2
function U.formatting_callback(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, {
    buffer = bufnr
  })
end

---Creates LSP mappings
---@param buf number
function U.mappings(buf)
  local opts = {
    buffer = buf
  }

  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gDh', '<cmd>vsplit<CR><cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gDj', '<cmd>split<CR><cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gdh', '<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gdj', '<cmd>split<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)

  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gih', '<cmd>vsplit<CR><cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gij', '<cmd>split<CR><cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', 'grh', '<cmd>vsplit<CR><cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', 'grj', '<cmd>split<CR><cmd>lua vim.lsp.buf.references()<CR>', opts)

  map('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  map('v', '<leader>fr', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  map('n', 'ghh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

return U
