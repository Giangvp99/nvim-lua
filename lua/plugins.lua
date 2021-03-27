local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'  -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- Quality of life improvements 
  use 'norcalli/nvim_utils' --xxx

  -- LSP
  use 'RishabhRD/popfix' --xxx
  use 'neovim/nvim-lspconfig'
  use({                           --xxx
    "RishabhRD/nvim-lsputils",
    requires = "RishabhRD/popfix",
  })
  use 'glepnir/lspsaga.nvim' --xxx
  use 'onsails/lspkind-nvim'
  use({ "nvim-lua/lsp-status.nvim" }) --xx
  use({ "ray-x/lsp_signature.nvim" })
  use({ "kosayoda/nvim-lightbulb"})
  use 'kabouzeid/nvim-lspinstall'
  use 'mfussenegger/nvim-jdtls'

  -- Debugging & linting
  use({ "mfussenegger/nvim-lint"})
  use({ "mfussenegger/nvim-dap" })
  use({ "theHamsta/nvim-dap-virtual-text" })

  -- Autocomplete
  use 'nvim-lua/completion-nvim'
  --use 'hrsh7th/nvim-compe'
  use 'mattn/emmet-vim'

  -- Snippets
  use({                   --xx
    "hrsh7th/vim-vsnip",
    requires = { "hrsh7th/vim-vsnip-integ" },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "nvim-treesitter/playground",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "p00f/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line and Bufferline
  use({
    "glepnir/galaxyline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use 'romgrk/barbar.nvim'
  use 'moll/vim-bbye'

  -- Tag viewer
  use({ "liuchengxu/vista.vim" })

  -- Undotree
  use({
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  })

  -- Find and replace
  use 'brooth/far.vim'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- Color && themes
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'TimUntersberger/neogit'
  use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'f-person/git-blame.nvim'
  use 'mattn/webapi-vim'
  use 'tpope/vim-fugitive'

  -- Format
  --use({"mhartington/formatter.nvim"})
  
  -- Comment
  use 'b3nj5m1n/kommentary'
  
  -- Ranger
  use 'kevinhwang91/rnvimr'
  
  -- Start vim
  use 'mhinz/vim-startify'

  -- Which key
  use 'liuchengxu/vim-which-key'
  
  -- Floaterm
  use 'voldikss/vim-floaterm'

  -- General Plugins
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  use 'unblevable/quick-scope'
  use 'airblade/vim-rooter'
  use 'psliwka/vim-smoothie'
  use 'turbio/bracey.vim'
  use 'AndrewRadev/tagalong.vim'
  use 'tpope/vim-sleuth'
  use 'phaazon/hop.nvim'
  use "blackCauldron7/surround.nvim"
  --use 'metakirby5/codi.vim'
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end }
end)
