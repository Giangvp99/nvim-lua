-- Floaterm
vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1

vim.cmd([[
nnoremap   <silent>   <F4>    :FloatermNew<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F2>    :FloatermPrev<CR>
tnoremap   <silent>   <F2>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F3>    :FloatermNext<CR>
tnoremap   <silent>   <F3>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F1>   :FloatermToggle<CR>
tnoremap   <silent>   <F1>   <C-\><C-n>:FloatermToggle<CR>
]])
