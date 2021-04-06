require'lspconfig'.jdtls.setup {cmd = {"jdtls"}, filetypes = {"java"}, on_attach = require'_lsp'.common_on_attach}
