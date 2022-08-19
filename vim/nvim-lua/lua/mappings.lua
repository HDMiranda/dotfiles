local function map(mapType, key, command)
    vim.keymap.set(mapType, key, command, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')
map('n', '<leader>wq', '<CMD>wqa<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')

-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')

-- Tabs
map('n', "<C-t>", '<CMD>tabnew<CR>')
map('n', "<C-t>q", '<CMD>tabclose<CR>')

-- Window splits
map('n', '<C-.>', '<CMD>vsplit<CR>')
map('n', '<C-/>', '<CMD>split<CR>')

-- Move between windows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Resize windows
map('n', '<LEFT>', '<C-w><')
map('n', '<DOWN>', '<CMD>resize -1<CR>')
map('n', '<UP>', '<CMD>resize +1<CR>')
map('n', '<RIGHT>', '<C-w>>')

-- Open NvimTree
map('n', '<C-o>', '<CMD>NvimTreeFindFileToggle<CR>')
map('i', '<C-o>', '<ESC><CMD>NvimTreeFindFileToggle<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<A-j>', '<CMD>move .+1<CR>')
map('n', '<A-k>', '<CMD>move .-2<CR>')
map('x', '<A-j>', ":move '>+1<CR>gv=gv")
map('x', '<A-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- Sessions
map('n', '<leader>s', ':SessionManager load_last_session<CR>')
map('n', '<leader>sl', ':SessionManager load_session<CR>')

-- Start screen (Alpha)
map('n', '<C-s>', ':Alpha<CR>')
