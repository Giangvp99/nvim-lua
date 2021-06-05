local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"
require'lspconfig'.omnisharp.setup {
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    filetypes = {"cs"},
    on_attach = require'config.lsp.services'.on_attach
}
