-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{
    on_attach = require'_lsp'.tsserver_on_attach,
}
