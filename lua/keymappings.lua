local utils = require('config.utils')

-- better window movement
utils.map('n', '<C-h>', '<C-w>h', {silent = true})
utils.map('n', '<C-j>', '<C-w>j', {silent = true})
utils.map('n', '<C-k>', '<C-w>k', {silent = true})
utils.map('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- better indenting
utils.map('v', '<', '<gv', {noremap = true, silent = true})
utils.map('v', '>', '>gv', {noremap = true, silent = true})

utils.map('i', 'jk', '<ESC>', {noremap = true, silent = true})
utils.map('i', 'kj', '<ESC>', {noremap = true, silent = true})
utils.map('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
utils.map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
utils.map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
utils.map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
utils.map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

