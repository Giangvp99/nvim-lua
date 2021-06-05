local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

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
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    use {"ray-x/lsp_signature.nvim", opt = true}

    -- Telescope
    use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use {"nvim-telescope/telescope.nvim", opt = true}
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {'nvim-telescope/telescope-media-files.nvim', opt = true}

    -- Debugging
    use {"mfussenegger/nvim-dap", opt = true}

    -- Autocomplete
    use {"hrsh7th/nvim-compe", opt = true}
    use {"hrsh7th/vim-vsnip", opt = true}
    use {"rafamadriz/friendly-snippets", opt = true}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use({"nvim-treesitter/nvim-treesitter-refactor", opt = true})
    use({"nvim-treesitter/playground", opt = true})
    use({"p00f/nvim-ts-rainbow", opt = true})
    use {"windwp/nvim-ts-autotag", opt = true}

    -- Explorer
    use {"kyazdani42/nvim-tree.lua", opt = true}
    -- TODO remove when open on dir is supported by nvimtree
    use "kevinhwang91/rnvimr"

    use {"lewis6991/gitsigns.nvim", opt = true}
    use {'f-person/git-blame.nvim', opt = true}
    use {"folke/which-key.nvim", opt = true}
    use {"ChristianChiarulli/dashboard-nvim", opt = true}
    use {"windwp/nvim-autopairs", opt = true}
    use {"terrortylor/nvim-comment", opt = true}
    use {"kevinhwang91/nvim-bqf", opt = true}

    -- Color
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt = true}

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", opt = true}
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Find and replace
    use {'brooth/far.vim', opt = true}

    -- Floaterm
    use {'voldikss/vim-floaterm', opt = true}

    use {"blackCauldron7/surround.nvim", opt = true}

    use {'mg979/vim-visual-multi', opt = true, branch = 'master'}

    use {'mattn/emmet-vim', opt = true}

    use {'junegunn/vim-easy-align', opt = true}

    use {'mfussenegger/nvim-jdtls', opt = true}

    use {'glench/vim-jinja2-syntax', opt = true}

    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    require_plugin("friendly-snippets")
    require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    require_plugin("telescope.nvim")
    require_plugin("telescope-media-files.nvim")
    require_plugin("nvim-dap")
    require_plugin("nvim-compe")
    require_plugin("completion-nvim")
    require_plugin("lsp_signature.nvim")
    require_plugin("vim-vsnip")
    require_plugin("nvim-treesitter")
    require_plugin("nvim-treesitter-refactor")
    require_plugin("playground")
    require_plugin("nvim-ts-rainbow")
    require_plugin("nvim-ts-autotag")
    require_plugin("nvim-tree.lua")
    require_plugin("gitsigns.nvim")
    require_plugin("git-blame")
    require_plugin("which-key.nvim")
    require_plugin("dashboard-nvim")
    require_plugin("nvim-autopairs")
    require_plugin("nvim-comment")
    require_plugin("nvim-bqf")
    require_plugin("nvcode-color-schemes.vim")
    require_plugin("nvim-web-devicons")
    require_plugin("galaxyline.nvim")
    require_plugin("nvim-bufferline")
    require_plugin("far.nvim")
    require_plugin("vim-floaterm")
    require_plugin("surround.nvim")
    require_plugin("vim-visual-multi")
    require_plugin("emmet-vim")
    require_plugin("vim-easy-align")
    require_plugin("nvim-jdtls")
    require_plugin("vim-jinja2-syntax")

end)
