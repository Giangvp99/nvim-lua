require'lspconfig'.html.setup{
    cmd = { "html-languageserver", "--stdio" },
    on_attach=require'_lsp'.common_on_attach
}
