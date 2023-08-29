local map = vim.keymap.set

local U = {}

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
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  map('v', '<leader>fr', '<cmd>lua vim.lsp.buf.range_format()<CR>', opts)
  map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  map('n', 'ghh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

return U
