local map = vim.keymap.set

local U = {}

---Creates LSP mappings
---@param buf number
function U.mappings(buf)
  local opts = {
    buffer = buf
  }

  opts.desc = 'Show hover'
  map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts)
  opts.desc = 'Signature help'
  map('i', '<C-h>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  opts.desc = 'Type definition'
  map('n', '<leader>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)

  opts.desc = 'Rename symbol'
  map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)

  opts.desc = 'Jump to declaration'
  map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  opts.desc = 'Jump to declaration vertical'
  map('n', 'gDh', ':vsplit<CR>:lua vim.lsp.buf.declaration()<CR>', opts)
  opts.desc = 'Jump to declaration horizontal'
  map('n', 'gDj', ':split<CR>:lua vim.lsp.buf.declaration()<CR>', opts)

  opts.desc = 'Jump to definition'
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  opts.desc = 'Jump to definition vertical'
  map('n', 'gdh', ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>', opts)
  opts.desc = 'Jump to definition horizontal'
  map('n', 'gdj', ':split<CR>:lua vim.lsp.buf.definition()<CR>', opts)

  opts.desc = 'Jump to implementation'
  map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  opts.desc = 'Jump to implementation vertical'
  map('n', 'gih', ':vsplit<CR>:lua vim.lsp.buf.implementation()<CR>', opts)
  opts.desc = 'Jump to implementation horizontal'
  map('n', 'gij', ':split<CR>:lua vim.lsp.buf.implementation()<CR>', opts)

  opts.desc = 'Show symbol references'
  map('n', 'gr', ':Telescope lsp_references<CR>', opts)

  opts.desc = 'Show document symbol references'
  map('n', '<leader>ts', ':Telescope lsp_document_symbols<CR>')

  opts.desc = 'Add workspace folder'
  map('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  opts.desc = 'Remove workspace folder'
  map('n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  opts.desc = 'Show workspaces list'
  map('n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  opts.desc = 'Show code actions'
  map('n', '<leader>c', ':lua vim.lsp.buf.code_action()<CR>', opts)
  opts.desc = 'Show code actions by range'
  map('v', '<leader>cr', ':lua vim.lsp.buf.range_code_action()<CR>', opts)

  opts.desc = 'Format'
  map('n', '<space>f', ':lua vim.lsp.buf.format()<CR>', opts)
  opts.desc = 'Format by range'
  map('v', '<leader>fr', ':lua vim.lsp.buf.range_format()<CR>', opts)

  opts.desc = 'Previous diagnostic'
  map('n', '[g', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  opts.desc = 'Next diagnostic'
  map('n', ']g', ':lua vim.diagnostic.goto_next()<CR>', opts)
  opts.desc = 'Add buffer diagnostic to location list'
  map('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
  opts.desc = 'Show diagnostics'
  map('n', 'ghh', ':lua vim.diagnostic.open_float()<CR>', opts)
end

return U
