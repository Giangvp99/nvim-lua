vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

require('config.nvimtree')
require('config.colorscheme')
require('config.treesitter')
require('config.bufferline')
require('config.galaxyline')

require('config.floaterm')
require('config.rnvimr')

require('config.cmp')
require('config.escape')
require('config.comment')
require('config.gitsigns')
require('config.telescope')
require('config.autopairs')
-- require('config.pears')
-- require('config.indent_blankline')
-- require('config.trouble')

require('config.lsp')
require('config.lspsaga')
require('config.lspkind')
require('config.lspsignature')

require('config.whichkey')
