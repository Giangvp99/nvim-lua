local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

vim.cmd('set iskeyword+=-')                  --treat dash separated words as a word text object"
vim.cmd('set shortmess+=c')                 --Don't pass messages to |ins-completion-menu|.
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('syntax enable')

opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('w', 'wrap', false)                               -- Disable line wrap
opt('o', 'encoding', "utf-8")                      --The encoding displayed
opt('o', 'pumheight', 10)                        --Makes popup menu smaller
opt('o', 'fileencoding', "utf-8")                  --The encoding written to file
opt('o', 'ruler', true)                   --                " Show the cursor position all the time
opt('o', 'cmdheight', 2)                         --More space for displaying messages
opt('o', 'mouse', "a")                             --Enable your mouse
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 't_Co', "256")                            --Support 256 colors
opt('o', 'conceallevel', 0)                      --So that I can see `` in markdown files
opt('b', 'tabstop', 2)                           -- Number of spaces tabs count for
opt('b', 'shiftwidth', 2)                        -- Size of an indent
opt('o', 'smarttab', true)                            --Makes tabbing smarter will realize you have 2 vs 4
opt('o', 'expandtab', true)                           -- Use spaces instead of tabs
opt('o', 'smartindent', true)                         -- Insert indents automatically
opt('o', 'autoindent', true)                        --Good auto indent
opt('o', 'laststatus', 2)                        --Always display the status line
opt('w', 'number', true)                              -- Print line number
opt('o', 'cursorline', true)                          --Enable highlighting of the current line
opt('o', 'background', "dark")                    --tell vim what the background color looks like
opt('o', 'showtabline', 2)                       --Always show tabs
opt('o', 'showmode', false)                          --We don't need to see things like -- INSERT -- anymore
opt('o', 'backup', false)                            --This is recommended by coc
opt('o', 'writebackup', false)                       --This is recommended by coc
opt('w', 'signcolumn', "yes")                      --Always show the signcolumn, otherwise it would shift the text each time
opt('o', 'updatetime', 300)                      --Faster completion
opt('o', 'timeoutlen', 100)                      --By default timeoutlen is 1000 ms
opt('o', 'incsearch', true)

opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
-- opt('o', 'ignorecase', true)                          -- Ignore case
-- opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
-- opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
-- opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('o', 'clipboard', "unnamedplus")               --Copy paste between vim and everything else
opt('o', 'guifont', "Fira Code")
