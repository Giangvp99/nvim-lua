-- local coq = require "coq"
require'lspconfig'.pyright.setup( -- coq.lsp_ensure_capabilities(
{settings = {python = {analysis = {typeCheckingMode = "off"}}}})
-- )
