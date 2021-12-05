require'lspconfig'.pyright.setup {
    settings = {python = {analysis = {typeCheckingMode = "off"}, venv = {"env"}}}
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
