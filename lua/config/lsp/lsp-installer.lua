local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("config.lsp.settings.json-ls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("config.lsp.settings.lua-ls")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("config.lsp.settings.pyright-ls")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "hls" then
		local haskell_opts = require("config.lsp.settings.haskell-ls")
		opts = vim.tbl_deep_extend("force", haskell_opts, opts)
	end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
