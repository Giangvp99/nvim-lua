local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    cmd = {"html-languageserver", "--stdio"},
    on_attach = require'config.lsp.services'.on_attach,
    capabilities = capabilities
}
