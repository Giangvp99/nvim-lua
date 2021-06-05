-- if vim.fn.has("unix") == 1 then
--     JAVA_LS_EXECUTABLE = 'java-lsp.sh'
-- else
--     print("Unsupported system")
-- end
-- 
-- local on_attach = function(client, bufr)
--     require('jdtls').setup_dap()
--     require'lsp'.common_on_attach(client, bufr)
-- end
-- 
-- require('jdtls').start_or_attach({
--     on_attach = on_attach,
--     cmd = {JAVA_LS_EXECUTABLE},
--     root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git'})
-- })


require'lspconfig'.jdtls.setup {cmd = {"jdtls"}, filetypes = {"java"}, on_attach = require'config.lsp.services'.on_attach}
