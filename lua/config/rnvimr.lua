-- Make Ranger replace netrw and be the file explorer
vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_draw_border = 1

-- Make Ranger to be hidden after picking a file
vim.g.rnvimr_pick_enable = 1

-- Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
vim.g.rnvimr_bw_enable = 1

-- vim.cmd('nmap <leader>r :RnvimrToggle<CR>')

-- vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'


vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1" --cmd="set draw_borders both"'
