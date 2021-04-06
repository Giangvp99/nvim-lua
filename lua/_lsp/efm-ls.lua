require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "javascript", "python", "html"},
    settings = {
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
                    formatStdin = true
                }
            },
            javascript = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}},
            python = {
                {formatCommand = "isort --quiet -", formatStdin = true},
                {formatCommand = "yapf --quiet", formatStdin = true}
            },
            html = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}}
        }
    }
}
