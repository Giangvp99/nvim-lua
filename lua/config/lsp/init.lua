-- TODO figure out why this don't work
vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})

-- scroll down hover doc or scroll in definition preview
vim.cmd('nnoremap <silent> <C-f> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
-- scroll up hover doc
vim.cmd('nnoremap <silent> <C-b> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ", "   (Method)", "   (Function)", "   (Constructor)", " ﴲ  (Field)", "[] (Variable)",
    "   (Class)", " ﰮ  (Interface)", "   (Module)", " 襁 (Property)", "   (Unit)", "   (Value)",
    " 練 (Enum)", "   (Keyword)", " ﬌  (Snippet)", "   (Color)", "   (File)", "   (Reference)",
    "   (Folder)", "   (EnumMember)", " ﲀ  (Constant)", " ﳤ  (Struct)", "   (Event)", "   (Operator)",
    "   (TypeParameter)"
}

require('config.lsp.lua-ls')
require('config.lsp.bash-ls')
require('config.lsp.clangd-ls')
require('config.lsp.css-ls')
require('config.lsp.efm-ls')
require('config.lsp.html-ls')
require('config.lsp.jdtls-ls')
require('config.lsp.js-ts-ls')
require('config.lsp.omnisharp-ls')
require('config.lsp.pyright-ls')
