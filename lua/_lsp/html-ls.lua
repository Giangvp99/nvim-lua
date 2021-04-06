local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    cmd = {"html-languageserver", "--stdio"},
    on_attach = require'_lsp'.common_on_attach,
    capabilities = capabilities
}
