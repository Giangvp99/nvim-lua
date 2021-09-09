-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/giangvp99/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/giangvp99/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/giangvp99/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/giangvp99/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/giangvp99/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["better-escape.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/better-escape.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/cmp-vsnip"
  },
  ["eclipse.jdt.ls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/eclipse.jdt.ls"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["jdtls-launcher"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/jdtls-launcher"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  rnvimr = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/rnvimr"
  },
  ["surround.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/surround.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-floaterm"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/vim-floaterm"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/giangvp99/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
