local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'


if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- Quality of life improvements
  use 'norcalli/nvim_utils'

  -- LSP
  use 'RishabhRD/popfix'
  use 'neovim/nvim-lspconfig'
  use({
    "RishabhRD/nvim-lsputils",
    requires = "RishabhRD/popfix",
  })
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use({ "tjdevries/lsp_extensions.nvim" })
  use({ "nvim-lua/lsp-status.nvim" })
  use({ "ray-x/lsp_signature.nvim" })
  use({
    "kosayoda/nvim-lightbulb",
  })

  -- Debugging & linting
  use({
    "mfussenegger/nvim-lint",
  })
  use({ "mfussenegger/nvim-dap" })
  use({ "theHamsta/nvim-dap-virtual-text" })

  --use 'mfussenegger/nvim-jdtls'

  -- Debugging
  --use 'mfussenegger/nvim-dap'

  -- Autocomplete
  use({"hrsh7th/nvim-compe"})
  --use 'nvim-lua/completion-nvim'

  -- Snippets
  use({
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

  -- Tag viewer
  use({ "liuchengxu/vista.vim" })

  -- Undotree
  use({
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  })

  -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'romgrk/barbar.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })


  -- Color
  --use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'TimUntersberger/neogit'
  use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'f-person/git-blame.nvim'
  -- Easily Create Gists
  --use 'mattn/vim-gist'
  use 'mattn/webapi-vim'

  -- Format
  --use({"mhartington/formatter.nvim"})
  use 'Chiel92/vim-autoformat'

  -- General Plugins
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  --use 'unblevable/quick-scope'
  use 'airblade/vim-rooter'
  use 'b3nj5m1n/kommentary'
  use 'kevinhwang91/rnvimr'
  use 'mhinz/vim-startify'
  --use 'metakirby5/codi.vim'
  use 'psliwka/vim-smoothie'
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'moll/vim-bbye'
  use 'turbio/bracey.vim'
  use 'AndrewRadev/tagalong.vim'
  use 'alvan/vim-closetag'
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end }
  use 'liuchengxu/vim-which-key'
  use 'tpope/vim-sleuth'
  use 'voldikss/vim-floaterm'
  use 'phaazon/hop.nvim'
  use({ "blackCauldron7/surround.nvim" })
end)
