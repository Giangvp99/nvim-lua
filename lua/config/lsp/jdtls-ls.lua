require'lspconfig'.jdtls.setup {cmd = {"jdtls"}, filetypes = {"java"}, on_attach = require'config.lsp.services'.on_attach}
