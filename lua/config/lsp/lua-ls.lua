-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua/config/lsp/lua-language-server"
local sumneko_binary = "/home/" .. USER ..
                           "/.config/nvim/lua/config/lsp/lua-language-server/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
-- local coq = require "coq"
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup( -- coq.lsp_ensure_capabilities(
{
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    [vim.fn.expand('${3rd}/love2d/library')] = true
                },
                preloadFileSize = 2000,
                maxPreload = 2000,
                checkThirdParty = false
            },
            telemetry = {enable = false}
        }
    }
})
-- )
