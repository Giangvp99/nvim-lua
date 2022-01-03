local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	-------------------------------------------------------------------------------------------------------
	use({ "wbthomason/packer.nvim" })

	-- LSP
	-------------------------------------------------------------------------------------------------------
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "tamago324/nlsp-settings.nvim" }) -- language server settings defined in json for
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	-- Language
	use({ "mfussenegger/nvim-jdtls" })
	use({ "eclipse/eclipse.jdt.ls" })
	use({ "eruizc-dev/jdtls-launcher" })

	-- Telescope
	-------------------------------------------------------------------------------------------------------
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-lua/popup.nvim" })

	-- Autocomplete + snippets
	-------------------------------------------------------------------------------------------------------
	-- Cmp
	use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/vim-vsnip", "hrsh7th/cmp-buffer" } })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-calc" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/vim-vsnip-integ" })
	use({ "rafamadriz/friendly-snippets" })

	-- Syntax
	-------------------------------------------------------------------------------------------------------
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- use {"nvim-treesitter/nvim-treesitter-refactor"}

	-- Explorer
	-------------------------------------------------------------------------------------------------------
	use({ "kyazdani42/nvim-tree.lua" })

	-- Whichkey
	-------------------------------------------------------------------------------------------------------
	use({ "folke/which-key.nvim" })

	-- Comment
	-------------------------------------------------------------------------------------------------------
	use({ "terrortylor/nvim-comment" })

	-- Floaterm
	-------------------------------------------------------------------------------------------------------
	use({ "voldikss/vim-floaterm" })
	use({ "kevinhwang91/rnvimr" })

	-- Search + replace
	-------------------------------------------------------------------------------------------------------
	use({ "mg979/vim-visual-multi", branch = "master" })
	use({ "blackCauldron7/surround.nvim" })

	-- Color schemes + Icons
	-------------------------------------------------------------------------------------------------------
	use({ "christianchiarulli/nvcode-color-schemes.vim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "kyazdani42/nvim-web-devicons" })

	-- Status Line and Bufferline
	-------------------------------------------------------------------------------------------------------
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/nvim-bufferline.lua" })
	use({ "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" })

	-- Git
	-------------------------------------------------------------------------------------------------------
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-lua/plenary.nvim" })

	-- Feature
	-------------------------------------------------------------------------------------------------------

	-- Auto pairs
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag" })

	-- Insert escape
	use({ "jdhao/better-escape.vim" })

	-- Rainbow
	use({ "p00f/nvim-ts-rainbow" })

	-- Dashboard
	use({ "glepnir/dashboard-nvim" })

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({ "alefpereira/pyenv-pyright" })
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
