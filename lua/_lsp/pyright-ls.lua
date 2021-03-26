require'lspconfig'.pyright.setup{
    filetypes = { "python" },
    on_attach = require'_lsp'.common_on_attach,
}
