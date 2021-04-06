-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
    on_attach = require'_lsp'.tsserver_on_attach,
    settings = {documentFormatting = false},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.tsserver.diagnostics.virtual_text,
            signs = O.tsserver.diagnostics.signs,
            underline = O.tsserver.diagnostics.underline,
            update_in_insert = true

        })
    }
}
