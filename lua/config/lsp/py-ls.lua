require'lspconfig'.pyls.setup {filetypes = {"python"}, on_attach = require'config.lsp.services'.on_attach}
