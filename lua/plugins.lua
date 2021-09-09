local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    -------------------------------------------------------------------------------------------------------
    use {"wbthomason/packer.nvim"}

    -- LSP
    -------------------------------------------------------------------------------------------------------
    use {"neovim/nvim-lspconfig", opt = true}
    use {"ray-x/lsp_signature.nvim", opt = true}
    use {"onsails/lspkind-nvim", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}

    require_plugin("nvim-lspconfig")
    require_plugin("lsp_signature.nvim")
    require_plugin("lspkind-nvim")
    require_plugin("lspsaga.nvim")

    -- Language
    use {'mfussenegger/nvim-jdtls', opt = true}
    use {"eclipse/eclipse.jdt.ls", opt = true}
    use {"eruizc-dev/jdtls-launcher", opt = true}

    require_plugin("nvim-jdtls")
    require_plugin("eclipse.jdt.ls")
    require_plugin("jdtls-launcher")

    -- Telescope
    -------------------------------------------------------------------------------------------------------
    use {"nvim-telescope/telescope.nvim", opt = true}
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {'nvim-telescope/telescope-media-files.nvim', opt = true}

    require_plugin("telescope.nvim")
    require_plugin("telescope-fzy-native.nvim")
    require_plugin("telescope-media-files.nvim")

    -- Autocomplete + snippets
    -------------------------------------------------------------------------------------------------------
    -- Cmp
    use {"hrsh7th/nvim-cmp", requires = {"hrsh7th/vim-vsnip", "hrsh7th/cmp-buffer"}, opt = true}
    use {"hrsh7th/cmp-nvim-lsp", opt = true}
    use {"hrsh7th/cmp-buffer", opt = true}
    use {"hrsh7th/cmp-calc", opt = true}
    use {"hrsh7th/cmp-vsnip", opt = true}
    use {"hrsh7th/cmp-nvim-lua", opt = true}
    -- Snippets
    use {"hrsh7th/vim-vsnip", opt = true}
    use {'hrsh7th/vim-vsnip-integ', opt = true}
    use {"rafamadriz/friendly-snippets", opt = true}

    require_plugin("nvim-cmp")
    require_plugin("cmp-nvim-lsp")
    require_plugin("cmp-buffer")
    require_plugin("cmp-calc")
    require_plugin("cmp-vsnip")
    require_plugin("cmp-nvim-lua")
    require_plugin("vim-vsnip")
    require_plugin("vim-vsnip-integ")
    require_plugin("friendly-snippets")

    -- Syntax
    -------------------------------------------------------------------------------------------------------
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", opt = true}
    use {"nvim-treesitter/nvim-treesitter-refactor", opt = true}

    require_plugin("nvim-treesitter")
    require_plugin("nvim-treesitter-refactor")

    -- Explorer
    -------------------------------------------------------------------------------------------------------
    use {"kyazdani42/nvim-tree.lua", opt = true}
    require_plugin("nvim-tree.lua")

    -- Whichkey
    -------------------------------------------------------------------------------------------------------
    use {"folke/which-key.nvim", opt = true}
    require_plugin("which-key.nvim")

    -- Comment
    -------------------------------------------------------------------------------------------------------
    use {"terrortylor/nvim-comment", opt = true}
    require_plugin("nvim-comment")

    -- Floaterm
    -------------------------------------------------------------------------------------------------------
    use {'voldikss/vim-floaterm', opt = true}
    use {'kevinhwang91/rnvimr', opt = true}

    require_plugin("vim-floaterm")
    require_plugin("rnvimr")

    -- Search + replace
    -------------------------------------------------------------------------------------------------------
    use {'mg979/vim-visual-multi', opt = true, branch = 'master'}
    use {"blackCauldron7/surround.nvim", opt = true}

    require_plugin("vim-visual-multi")
    require_plugin("surround.nvim")

    -- Color schemes + Icons
    -------------------------------------------------------------------------------------------------------
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    use {'norcalli/nvim-colorizer.lua', opt = true}
    use {"kyazdani42/nvim-web-devicons", opt = true}

    require_plugin("nvcode-color-schemes.vim")
    require_plugin("nvim-colorizer.lua")
    require_plugin("nvim-web-devicons")

    -- Status Line and Bufferline
    -------------------------------------------------------------------------------------------------------
    use {"glepnir/galaxyline.nvim", opt = true}
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    require_plugin("galaxyline.nvim")
    require_plugin("nvim-bufferline")

    -- Git
    -------------------------------------------------------------------------------------------------------
    use {"lewis6991/gitsigns.nvim", opt = true, requires = {'nvim-lua/plenary.nvim'}}
    use {"nvim-lua/plenary.nvim", opt = true}

    require_plugin("gitsigns.nvim")
    require_plugin("plenary.nvim")

    -- Feature
    -------------------------------------------------------------------------------------------------------

    -- Auto pairs
    use {'windwp/nvim-autopairs', opt = true}
    use {"windwp/nvim-ts-autotag", opt = true}
    -- use {'steelsojka/pears.nvim', opt = true}

    -- require_plugin('pears.nvim')
    require_plugin('nvim-autopairs')
    require_plugin("nvim-ts-autotag")

    -- Insert escape
    use {'jdhao/better-escape.vim', opt = true}
    require_plugin("better-escape.vim")

    -- Rainbow
    use {"p00f/nvim-ts-rainbow", opt = true}
    require_plugin("nvim-ts-rainbow")

    -- Telescope
    -- use {"nvim-lua/popup.nvim", opt = true}
    --    require_plugin("popup.nvim")

    -- Debugging
    -- use {"mfussenegger/nvim-dap", opt = true}
    --    require_plugin("nvim-dap")

    -- use {'ms-jpq/coq_nvim', branch = 'coq', opt = true} -- main one
    -- require_plugin("coq_nvim")
    -- use {'ms-jpq/coq.artifacts', branch = 'artifacts', opt = true} -- 9000+ Snippets
    -- require_plugin("coq.artifacts")

    -- use {"nvim-treesitter/playground", opt = true}
    --   require_plugin("playground")

    -- use {'f-person/git-blame.nvim', opt = true}
    --    require_plugin("git-blame")

    -- use {"kevinhwang91/nvim-bqf", opt = true}
    --    require_plugin("nvim-bqf")

    -- Find and replace
    -- use {'brooth/far.vim', opt = true}
    --    require_plugin("far.nvim")

    -- use {'mattn/emmet-vim', opt = true}
    --    require_plugin("emmet-vim")

    -- use {'junegunn/vim-easy-align', opt = true}
    --    require_plugin("vim-easy-align")

    -- use {'mfussenegger/nvim-jdtls', opt = true}
    --    require_plugin("nvim-jdtls")

    -- use {'mitsuhiko/vim-jinja', opt = true}
    --    require_plugin("vim-jinja")

    -- use {'norcalli/snippets.nvim', opt = true}
    --    require_plugin("snippets.nvim")

    --    use {"lukas-reineke/indent-blankline.nvim", opt = true}
    --    require_plugin("indent-blankline.nvim")

end)
