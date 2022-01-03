return {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("${3rd}/love2d/library")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				preloadFileSize = 2000,
				maxPreload = 2000,
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
