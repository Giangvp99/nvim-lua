vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', {noremap = true, silent = true})

vim.cmd([[
let bufferline = get(g:, 'bufferline', {})
let bufferline.maximum_padding = 2
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = '▎'
]])
