-- local coq = require "coq"
require'lspconfig'.jdtls.setup( -- coq.lsp_ensure_capabilities(
{cmd = {vim.fn.expand('~/.config/nvim/lua/config/lsp/java-lsp')}} -- )
) -- vim.cmd [[
--     autocmd FileType java lua require('jdtls').start_or_attach({cmd = {vim.fn.expand('~/.config/nvim/lua/config/lsp/java-ls')}})
-- ]]
-- require('jdtls').start_or_attach({cmd = {vim.fn.expand('~/.config/nvim/lua/config/lsp/java-lsp')}})
-- require'lspconfig'.jdtls.setup {
--     cmd = {'jdtls'},
--     root_dir = function(fname)
--         return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
--     end
-- }

