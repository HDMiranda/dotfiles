local function map(mapType, key, command, opts)
  vim.keymap.set(mapType, key, command, opts)
end

local opts = {
  silent = true,
  desc = ''
}

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N', opts)

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Quickly save the current buffer or all buffers
opts.desc = 'Force write'
map('n', '<leader>w', ':w!<CR>', opts)
opts.desc = 'Write all'
map('n', '<leader>W', ':wall<CR>', opts)

-- Quit neovim
map('n', '<C-Q>', ':q<CR>', opts)
opts.desc = 'Quit and write all'
map('n', '<leader>wq', ':wqa<CR>', opts)
opts.desc = 'Force quit and write all'
map('n', '<leader>WQ', ':wqa!<CR>', opts)
opts.desc = 'Force quit all'
map('n', '<leader>Q', ':qa!<CR>', opts)

-- leader-o/O inserts blank line below/above
opts.desc = 'Add empty line before'
map('n', '<leader>o', 'o<ESC>', opts)
opts.desc = 'Add empty line after'
map('n', '<leader>O', 'O<ESC>', opts)

-- Move to the next/previous buffer
opts.desc = 'Go to previous buffer'
map('n', '<leader>[', ':bp<CR>', opts)
opts.desc = 'Go to next buffer'
map('n', '<leader>]', ':bn<CR>', opts)

-- Move to last buffer
opts.desc = 'Go to last buffer'
map('n', '<leader>[[', ':b#<CR>', opts)

-- Tabs
opts.desc = 'New tab'
map('n', '<C-t>', ':tabnew<CR>', opts)
opts.desc = 'Close tab'
map('n', '<C-t>q', ':tabclose<CR>', opts)

-- Window splits
opts.desc = 'Split vertically'
map('n', '<C-.>', ':vsplit<CR>', opts)
opts.desc = 'Split horizontally'
map('n', '<C-/>', ':split<CR>', opts)

-- Move between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize windows
map('n', '<LEFT>', '<C-w><', opts)
map('n', '<DOWN>', ':resize -1<CR>', opts)
map('n', '<UP>', ':resize +1<CR>', opts)
map('n', '<RIGHT>', '<C-w>>', opts)

-- Open NvimTree
-- Current File
map('n', '<C-c>', ':NvimTreeFindFile<CR>', opts)
map('i', '<C-c>', '<ESC>:NvimTreeFindFile<CR>', opts)
-- Toggle
map('n', '<C-a>', ':NvimTreeToggle<CR>', opts)
map('i', '<C-a>', '<ESC>:NvimTreeToggle<CR>', opts)

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<A-j>', ':move .+1<CR>', opts)
map('n', '<A-k>', ':move .-2<CR>', opts)
map('x', '<A-j>', ":move '>+1<CR>gv=gv")
map('x', '<A-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z', opts)
map('x', 'A', ':<C-U>normal! ggVG<CR>', opts)

-- Sessions
opts.desc = 'Load last session'
map('n', '<leader>s', ':SessionManager load_last_session<CR>', opts)
opts.desc = 'Select session to load'
map('n', '<leader>sl', ':SessionManager load_session<CR>', opts)

-- Telescope
opts.desc = 'Marks list'
map('n', '<leader>tm', ':Telescope marks<CR>', opts)
opts.desc = 'Help tags list'
map('n', '<leader>th', ':Telescope help_tags<CR>', opts)
opts.desc = 'Buffers list'
map('n', '<leader>tb', ':Telescope buffers<CR>', opts)                                                   -- Fuzzy find active buffers
opts.desc = 'Search by string'
map('n', '<leader>tf', ':Telescope live_grep<CR>', opts)                                                 -- Search for string
opts.desc = 'Search by string in active buffers'
map('n', '<leader>tbf', ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", opts) -- Search for string in active buffers
opts.desc = 'Git status'
map('n', '<leader>tgs', ':Telescope git_status<CR>', opts)                                               -- Fuzzy find changed files in git
opts.desc = 'Git commits'
map('n', '<leader>tg', ':Telescope git_commits<CR>', opts)                                               -- Fuzzy find commits in git

-- Git (Fugitive)
opts.desc = 'Git'
map('n', '<leader>G', ':Git<CR>', opts)

-- Undotree
opts.desc = 'Undotree'
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)

-- TodoComments
opts.desc = 'List TODOs'
map('n', '<leader>tt', ':TodoTelescope<CR>', opts)
map('n', ']t', function()
  require('todo-comments').jump_next({ keywords = { 'ERROR', 'WARNING', 'FIX' } })
end, { desc = 'Next todo comment' })

map('n', '[t', function()
  require('todo-comments').jump_prev({ keywords = { 'ERROR', 'WARNING', 'FIX' } })
end, { desc = 'Previous todo comment' })
