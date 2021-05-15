require('plugins')
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
require('globals')
require('settings')
require('keymappings')
vim.cmd('luafile ~/.config/nvim/O.lua')
require('config')
