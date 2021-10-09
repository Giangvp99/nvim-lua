local utils = require('utils')

-- Set leader
-- utils.map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- better window movement
utils.map('n', '<A-h>', '<C-w>h', {silent = true})
utils.map('n', '<A-j>', '<C-w>j', {silent = true})
utils.map('n', '<A-k>', '<C-w>k', {silent = true})
utils.map('n', '<A-l>', '<C-w>l', {silent = true})

-- Terminal window navigation
utils.map('t', '<A-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
utils.map('t', '<A-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
utils.map('t', '<A-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
utils.map('t', '<A-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
utils.map('i', '<A-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
utils.map('i', '<A-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
utils.map('i', '<A-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
utils.map('i', '<A-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
utils.map('t', '<esc>', '<C-\\><C-N>', {noremap = true, silent = true})

-- resize with arrows
utils.map('n', '<A-Up>', ':resize -2<cr>', {noremap = true, silent = true})
utils.map('n', '<A-Down>', ':resize +2<cr>', {noremap = true, silent = true})
utils.map('n', '<A-Left>', ':vertical resize +2<cr>', {noremap = true, silent = true})
utils.map('n', '<A-Right>', ':vertical resize -2<cr>', {noremap = true, silent = true})

-- better indenting
utils.map('v', '<', '<gv', {noremap = true, silent = true})
utils.map('v', '>', '>gv', {noremap = true, silent = true})

utils.map('i', 'jk', '<ESC>', {noremap = true, silent = true})
-- utils.map('i', 'kj', '<ESC>', {noremap = true, silent = true})
-- utils.map('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
utils.map('n', '<TAB>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
utils.map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
utils.map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
utils.map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Comments
utils.map("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

utils.map("n", "<C-Space>", ":FloatermToggle<cr>", {noremap = true, silent = true})
utils.map("t", "<C-n>", "<C-\\><C-N>:FloatermNew<cr>", {noremap = true, silent = true})
utils.map("t", "<C-j>", "<C-\\><C-N>:FloatermPrev<cr>", {noremap = true, silent = true})
utils.map("t", "<C-k>", "<C-\\><C-N>:FloatermNext<cr>", {noremap = true, silent = true})
utils.map("t", "<C-Space>", "<C-\\><C-N>:FloatermToggle<cr>", {noremap = true, silent = true})
