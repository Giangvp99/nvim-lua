local utils = require('config.utils')

vim.g.mapleader = ' '

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('syntax enable')

utils.opt('o', 'hidden', O.hidden_files) -- Enable modified buffers in background
utils.opt('w', 'wrap', O.wrap_lines) -- Disable line wrap
utils.opt('o', 'encoding', "utf-8") -- The encoding displayed
utils.opt('o', 'pumheight', 10) -- Makes popup menu smaller
utils.opt('o', 'fileencoding', "utf-8") -- The encoding written to file
utils.opt('o', 'ruler', true) --                " Show the cursor position all the time
utils.opt('o', 'cmdheight', 2) -- More space for displaying messages
utils.opt('o', 'mouse', "a") -- Enable your mouse
utils.opt('o', 'splitbelow', true) -- Put new windows below current
utils.opt('o', 'termguicolors', true) -- True color support
utils.opt('o', 'splitright', true) -- Put new windows right of current
utils.opt('o', 't_Co', "256") -- Support 256 colors
utils.opt('o', 'conceallevel', 0) -- So that I can see `` in markdown files
utils.opt('b', 'tabstop', 2) -- Number of spaces tabs count for
utils.opt('b', 'shiftwidth', 2) -- Size of an indent
utils.opt('o', 'smarttab', true) -- Makes tabbing smarter will realize you have 2 vs 4
utils.opt('o', 'expandtab', true) -- Use spaces instead of tabs
utils.opt('o', 'smartindent', true) -- Insert indents automatically
utils.opt('o', 'autoindent', true) -- Good auto indent
utils.opt('o', 'laststatus', 2) -- Always display the status line
utils.opt('w', 'number', O.number) -- Print line number
utils.opt('o', 'cursorline', true) -- Enable highlighting of the current line
utils.opt('o', 'background', "dark") -- tell vim what the background color looks like
utils.opt('o', 'showtabline', 2) -- Always show tabs
utils.opt('o', 'showmode', false) -- We don't need to see things like -- INSERT -- anymore
utils.opt('o', 'backup', false) -- This is recommended by coc
utils.opt('o', 'writebackup', false) -- This is recommended by coc
utils.opt('w', 'signcolumn', "yes") -- Always show the signcolumn, otherwise it would shift the text each time
utils.opt('o', 'updatetime', 300) -- Faster completion
utils.opt('o', 'timeoutlen', 100) -- By default timeoutlen is 1000 ms
utils.opt('o', 'incsearch', true)

utils.opt('o', 'completeopt', 'menuone,noinsert,noselect') -- Completion options (for deoplete)
utils.opt('o', 'scrolloff', 4) -- Lines of context
utils.opt('o', 'shiftround', true) -- Round indent
utils.opt('o', 'sidescrolloff', 8) -- Columns of context
utils.opt('o', 'smartcase', true) -- Don't ignore case with capitals
utils.opt('w', 'relativenumber', O.relative_number) -- Relative line numbers
utils.opt('o', 'clipboard', "unnamedplus") -- Copy paste between vim and everything else
utils.opt('o', 'guifont', "Fira Code")
